class MatchesController < ApplicationController
  before_action :set_user_and_cat, only: [:create]

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to cats_path, notice: 'Match request sent!'
    else
      render :new, alert: "Failed to send match request."
    end
  end

  def index
    @pending_matches = Match.where(cat_id: current_user.cats.select(:id), status: :pending)
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      if @match.accepted?
        Chatroom.create(name: "Chat between #{User.first.first_name} and #{Cat.first.name}", match_id: @match.id)
        redirect_to chatrooms_path, notice: 'Match accepted and chatroom created!'
      else
        redirect_to matches_path, notice: 'Match rejected.'
      end
    else
      render :edit, alert: 'Failed to update match.'
    end
  end

  private

  def match_params
    params.require(:match).permit(:user_id, :cat_id, :accepted)
  end

  def set_user_and_cat
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @cat = Cat.find(params[:cat_id]) if params[:cat_id].present?
  end
end
