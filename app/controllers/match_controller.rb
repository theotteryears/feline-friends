class MatchController < ApplicationController

  def create
    @cat = Cat.find(params[:cat_id])
    @match = Match.new(match_params)
    @match.cat = @cat
    cat_owner = @cat.user
    @match.user = current_user
    if @match.save
      redirect_to cat_match_path
    else
      render :new, status: :unprocessable_entity
    end
  end

end
