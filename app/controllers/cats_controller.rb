require_relative '../models/cat' # Add this line to import the Cat model

class CatsController < ApplicationController
  skip_after_action :verify_authorized, only: :map
  after_action :verify_policy_scoped, only: :map

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

  def top
    @cats = Cat.average_rating
    authorize current_user
  end

  def map
    @cats = policy_scope(Cat)
    @markers = @cats.geocoded.map do |cat|
      {
        lat: cat.latitude,
        lng: cat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {cat: cat}),
        marker_html: render_to_string(partial: "marker", locals: {cat: cat})
      }
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :personality, :age, :breed, :img_1, :img_2, :img_3)
  end
end
