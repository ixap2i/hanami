class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save
    redirect_to images_path
  end

  def slider
    @images = Image.all    
  end

  private
  def image_params
    params.require(:image).permit(:title, :comment, :image)
  end
end
