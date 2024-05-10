class MatchesController < ApplicationController
  before_action :set_user_and_cat, only: [:create]

  def new
  end

  def index
    @matches = policy_scope(Match)
    @pending_matches = Match.where(cat_id: current_user.cats.select(:id), status: :pending)
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
      redirect_to chatroom_path(@chatroom)
    end
  end

  def accept
    @match = Match.find(params[:id])
    authorize @match
    @match.status = "accepted"
    @match.save!
    if @match.status == "accepted"
      redirect_to chatroom_path(@match.chatroom)
    end
  end

  def decline
    @match = Match.find(params[:id])
    authorize @match
    @match.status = "declined"
    @match.save!
    if @match.status == "declined"
      redirect_to user_matches_path(current_user), notice: 'Match rejected.'
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
