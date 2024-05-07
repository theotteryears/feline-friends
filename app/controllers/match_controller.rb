class MatchController < ApplicationController
  def new
    @match = Match.new
    @cat = Cat.find(params[:cat_id])
  end
  def create
    @cat = Cat.find(params[:cat_id])
    @match = Match.new(match_params)
    @match.cat = @cat
    @match.user = current_user
    if @match.save
      redirect_to cat_match_path
    else
      render :new
    end
  end

  private

  def match_params
    params.require(:match).permit(:user_id, :cat_id)
  end

end
