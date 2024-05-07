class CatsController < ApplicationController
  def index
    @cats = Cat.all
    @cats = policy_scope(Cat)
  end

  def show
    authorize @cats
    @cat = Cat.find(params[:id])
  end

  def new
    authorize @cats
    @cat = Cat.new
  end

  def create
    authorize @cats
    @cat = Cat.new(cat_params)
    @cat.save
    @cat.user = current_user
    redirect_to cat_path(@cat)
  end

  def edit
    authorize @cat
    @cat = Cat.find(params[:id])
  end

  def update
    authorize @cat
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)
    redirect_to cat_path(@cat)
  end

  def destroy
    authorize @cat
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to cats_path, status: :see_other
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :details)
  end
end
