class PhotosController < ApplicationController

 def destroy
      @photo = Photo.find(params[:id]) #correspond à l’id de la photo concernée
       room = @photo.room
      @photo.destroy
      @photos = Photo.where(room_id: room.id) #réactualise la liste des photos de ce logement
      respond_to :js #pour la suppression immédiate --> destroy.js.erb

        end
    end