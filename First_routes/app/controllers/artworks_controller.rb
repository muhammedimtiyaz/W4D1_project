class ArtworksController < ApplicationController

    def index
        render json: Artwork.all
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            render json: artwork
        else
            render json: "Artwork #{params[:id]} not found"
        end
    end

    def update
        artwork = Artwork.update(params[:id], artwork_params)
        if artwork.valid?
            render plain: 'Artwork info updated'
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        artwork.destroy
        render json: artwork  
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end