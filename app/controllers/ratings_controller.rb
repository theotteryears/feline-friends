class RatingsController < ApplicationController
  before_action :set_match, only: [:new, :create]

  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.match = @match
    # @rating.user = current_user
    if @rating.save
      redirect_to match_path(@match)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to match_path(@rating.match), status: :see_other
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def rating_params
    params.require(:rating).permit(:rating, :match_id)
  end
end
