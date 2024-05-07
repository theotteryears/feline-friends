class MatchesController < ApplicationController

  def create
    @cat = Cat.find(params[:cat_id])

    @match = Match.new
    @match.cat = @cat
    # cat_owner = @cat.user
    @match.user = current_user
    if @match.save
      redirect_to cat_matches_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
