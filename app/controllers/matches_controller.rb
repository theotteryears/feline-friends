class MatchesController < ApplicationController
  before_action :set_user_and_cat, only: [:create]

  def create
    @match = Match.new
    @match.cat = @cat
    @match.user = current_user || @user
    authorize @match
    if @match.save
      @chatroom = Chatroom.create(
        name: "Chat between #{current_user.first_name} and #{@cat.name}",
        match_id: @match.id
      )
      redirect_to chatroom_path(@chatroom)
    else
      render :new, alert: "Match not created"
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
    raise
    params.require(:match).permit(:user_id, :cat_id, :accepted)
  end

  def set_user_and_cat
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @cat = Cat.find(params[:cat_id]) if params[:cat_id].present?
  end
end
