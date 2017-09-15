class PicturesController < ApplicationController
def index
end

def create
end

def edit
end

def update
end

def destroy
end


def picture_params
  # params.require(:picture).permit(:date)
  params.require(:picture).permit(:date, :image, :image_cache, :remove_image)
end
