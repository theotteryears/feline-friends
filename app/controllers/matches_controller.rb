class MatchesController < ApplicationController
  before_action :set_user_and_cat, only: [:create]

  def new
  end

  def index
    @matches = policy_scope(Match)
    if current_user.role == "cat_owner"
    @pending_matches = Match.where(cat_id: current_user.cats.select(:id), status: :pending)
    else
    @pending_matches = Match.where(user_id: current_user, status: :pending)
    end
  end

  def create
    @match = Match.new
    @match.cat = @cat
    @match.user = current_user || @user
    authorize @match
    if @match.save
      @chatroom = Chatroom.create(
        name: "Chat",
        match_id: @match.id
      )
      flash.notice = "Match request sent!"
      redirect_to cats_path
    end
  end

  def accept
    @match = Match.find(params[:id])
    authorize @match
    @match.status = "accepted"
    @match.save!
    if @match.status == "accepted"
      flash.notice = ""
      # Notify the cat sitter using WebSockets
      NotificationChannel.broadcast_to(@match.user, render_to_string(partial: "shared/accepted", locals: { match: @match}))
      redirect_to chatroom_path(@match.chatroom)
    end
  end

  def decline
    @match = Match.find(params[:id])
    authorize @match
    @match.status = "declined"
    @match.save!
    if @match.status == "declined"
      flash.notice = ""
      NotificationChannel.broadcast_to(@match.user, render_to_string(partial: "shared/declined", locals: { match: @match}))
      redirect_to user_matches_path(current_user)
    end
  end


  private

  def match_params
    params.require(:match).permit(:user_id, :cat_id, :status)
  end

  def set_user_and_cat
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @cat = Cat.find(params[:cat_id]) if params[:cat_id].present?
  end
end
