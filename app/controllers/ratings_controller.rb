class RatingsController < ApplicationController
  before_action :set_cat, only: %i[new create]

  def new
    @rating = Rating.new
    authorize @rating
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.cat = @cat
    authorize @rating
    if @rating.save
      redirect_to chatroom_path(@cat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_cat
    @cat = Cat.find(params[:cat_id])
  end

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
