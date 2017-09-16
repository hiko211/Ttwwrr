class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

   def index
    @picture = Picture.all
   end

   def new
    if params[:back]
     @picture = Picture.new(pictures_params)
    else
     @picture = Picture.new
    end
   end

   def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save(pictures_params)
     redirect_to pictures_path
    else
     render 'new'
    end
   end

   def update
    # binding.pry
    if @picture.update(pictures_params)
     redirect_to pictures_path
    else
     render 'edit'
    end
  end

   def destroy
    @picture.destroy
    redirect_to pictures_path
   end

   private
    def pictures_params
     # params.require(:picture).permit(:date)
      params.require(:picture).permit(:date, :image, :image_cache, :remove_image)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
