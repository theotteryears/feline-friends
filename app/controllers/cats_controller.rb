require_relative '../models/cat' # Add this line to import the Cat model

class CatsController < ApplicationController
  def index
    @cats = policy_scope(Cat)
    if params[:query].present?
      @cats = @cats.joins(:user).where(users: { city: params[:query].capitalize })
      # @cats = @cats.joins(user:).where("users.city ILIKE :query", query: "%#{params[:query]}%")
    end
    # @average_rating = @cat.ratings.average(:rating)
  end

  def show
    @cat = Cat.find(params[:id])
    authorize @cat
    @average_rating = @cat.ratings.average(:rating)
  end

  def new
    @cat = Cat.new
    authorize @cat
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
    if @cat.save
      redirect_to root_path(@cat)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @cat
  end

  def edit
    @cat = Cat.find(params[:id])
    authorize @cat
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)
    redirect_to cat_path(@cat)
    authorize @cat
  end

  def destroy
    @cat = Cat.find(params[:id])
    authorize @cat
    @cat.destroy
    redirect_to cats_path, status: :see_other
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :personality, :age, :breed, :img_1, :img_2, :img_3)
  end
end
