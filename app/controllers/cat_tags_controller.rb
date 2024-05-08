class CatTagsController < ApplicationController
  def new
    @cat = Cat.find(params[:cat_id])
    @cat_tag = CatTag.new
    authorize @cat_tag
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @tags = Tag.where(id: params.dig(:cat_tag, :tag))
    @tags.each do |tag|
      authorize @cat_tag
      cat_tag = CatTag.new(cat: @cat, tag: tag)
      cat_tag.save
    end
    redirect_to cat_path(@cat_tag.cat)
  end

  private

  def render_new
    @cat_tag = CatTag.new
    @cat_tag.errors.add(:base, "A selected already exists")
    render :new, status: :unprocessable_entity
  end
end
