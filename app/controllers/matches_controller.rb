class MatchesController < ApplicationController
  before_action :set_user_and_cat, only: [:create]

  def create
    @match = Match.new(match_params)
    authorize @match
    if @match.save
    # here we want to notify the cat owner that they have received a match request
      redirect_to cats_path, notice: 'Match request sent!'
    else
      render :new, alert: "Failed to send match request."
    end
  end

  def index
    @matches = policy_scope(Match)
    @pending_matches = Match.where(cat_id: current_user.cats.select(:id), status: :pending)
  end

  def update
    authorize @match
    @match = Match.find(params[:id])
    if @match.update(match_params)
      if @match.accepted?
        authorize @chatroom
        Chatroom.create(name: "Chat between #{User.first.first_name} and #{Cat.first.name}", match_id: @match.id)
        redirect_to chatrooms_path, notice: 'Match accepted and chatroom created!'
      else
        redirect_to matches_path, notice: 'Match rejected.'
      end
    else
      render :edit, alert: 'Failed to update match.'
    end
  end

    # if I am the owner
    # if params[:user_id].present?
    #  @user = User.find(params[:user_id])
    #  @cats = current_user.cats
    #  @cats.each do |cat|
    #    create_a_match(@user, cat)
    #  end
    # if I am the sitter
    # elsif params[:cat_id].present?
    #  @user = current_user
    #  @cat = Cat.find(params[:cat_id])
    #  create_a_match(@user, @cat)
    # end


  private

  # def create_a_match(user, cat)
  #  @match = Match.find_by(cat: cat, user: user)
  #  if @match.present?
  #    authorize @match
  #    @match.update(accepted: true)
  #   name = "test"
  #   @chatroom = Chatroom.create(match_id: @match, name: name)
  #   redirect_to chatroom_path
  # else
  #   @match = Match.new(user: user, cat: cat)
  #   authorize @match
  #   @match.save
  #   redirect_to cat_matches_path
  # end
  # end

  def match_params
    params.require(:match).permit(:user_id, :cat_id, :accepted)
  end

  def set_user_and_cat
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @cat = Cat.find(params[:cat_id]) if params[:cat_id].present?
  end
end
