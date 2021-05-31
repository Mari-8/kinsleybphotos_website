class GalleriesController < ApplicationController

    def index 
        galleries = Gallery.all 
        render json: galleries 
    end 

    def show 
        gallery = Gallery.find(params[:id])
        render json: gallery
    end 

    def create 
        gallery = Gallery.new(gellery_params) 
        if gallery.save 
            render json: gallery 
        else 
            render json: { error: "There was a problem creating your gallery" } 
        end 
    end 

    def update 
        gallery = Gallery.find(params[:id])
        if gallery 
            gallery.update(gallery_params) 
            render json: gallery 
        else 
            render json: { error: 'There was a problem updating this gallery'}
        end 
    end 

    def destroy 
        gallery = Gallery.find(params[:id]) 
        if gallery 
            gallery.destroy 
            render json: { message: 'Destroyed gallery' } 
        else 
            render json: { error: 'There was a problem deleting gallery'}
        end 
    end 

    private 

    def gallery_params 
        params.permit(:title, :description)
    end 
end