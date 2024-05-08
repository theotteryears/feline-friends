class CatsController < ApplicationController
  def index
    @cats = Cat.all
    @cats = policy_scope(Cat)
  end

  def show
    @cat = Cat.find(params[:id])
    authorize @cat
  end

  def new
    @cat = Cat.new
    authorize @cat
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
    if @cat.save
      redirect_to cat_path(@cat)
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
    params.require(:cat).permit(:name, :details, img_1: [])
  end
end
