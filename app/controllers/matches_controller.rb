class MatchesController < ApplicationController
  def index
    @matches = policy_scope(Match).where(user: current_user)
    @matches = @matches.where(accepted: true)
  end

  def create
    # if I am the owner
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @cats = current_user.cats
      @cats.each do |cat|
        create_a_match(@user, cat)
      end
    # if I am the sitter
    elsif params[:cat_id].present?
      @user = current_user
      @cat = Cat.find(params[:cat_id])
      create_a_match(@user, @cat)
    end
  end

  private

  def create_a_match(user, cat)
    @match = Match.find_by(cat: cat, user: user)
    if @match.present?
      authorize @match
      @match.update(accepted: true)
      # redirect_to chatroom_path
    else
      @match = Match.new(user: user, cat: cat)
      authorize @match
      @match.save
      redirect_to cat_matches_path
    end
  end

  def match_params
    params.require(:match).permit(:user_id, :cat_id, :accepted)
  end
end
