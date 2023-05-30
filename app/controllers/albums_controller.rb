class AlbumsController < ApplicationController
    def index
        if logged_in? 
            render json: current_user.albums, each_serializer: AlbumSerializer
        else
            render json: []
        end
    end

    def create
        album = Album.new(album_params)

        if album.save
            render json: {user: AlbumSerializer.new(album)}
        else
            if user.errors.messages
                render json: {error: user.errors.messages}
            else
                render json: {error: "Album could not be created. Please try again."}
            end
        end
    end

    private
    def album_params
    params
      .require(:album)
      .permit(:title, :artist, :img, :user)
      .with_defaults(user: current_user)
    end
end
