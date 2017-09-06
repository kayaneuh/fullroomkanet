class RoomController < ApplicationController
    
    # lancer la méthode set_room pour les méthodes ci-dessous
    before_action :set_room, only: [:show, :edit, :update]
    
    # pour toutes ces méthodes, il faut être identifié sauf pour la méhtode show (car pas besoin d'être co ou avoir un compte pour voir les annonces)
    before action :authenticate_user!, except: [:show]
    
    # la méthode pour la page ou l'on va référencer toutes les annonces d'un user
    def index
        @rooms = current_user.rooms
    end
    
    # new : permet de créer une nouvelle entrée dans la table room par le current user
    def new
        @room = current_user.rooms.build
    end
    
    # create : création nouvelle entrée dans la table room avec les params
    def create
      @room = current_user.rooms.build(room_params)
      if @room.save
            redirect_to @room, notice:"Votre annonce a été ajouté avec succès" #redirige vers la page de l’annonce et notifie l’utilisateur de la réussite de la création
      else
           render :new # s’il y a une erreur, redirige vers la page de création new
      end
    end
    
    def update
       if @room.update(room_params)
              redirect to @room, notice:"Modification enregistrée..."
       else
           render :edit
    end
    end
        
    
    # la méthode show va montrer l'annonce id:X
    def show
    end
    
    # la méthode edit va editer l'annonce id:X
    def edit
    end
   
   # la méthode update va mettre à jour l'annonce id:X
    def update
    end
    
    # pour ne pas répéter du code pour la méthode show, edit et update
    # on créé cette méthode privée set_room et on la lance pour les méthodes précédentes
    # pour cela, on créé un before_action
    private
    def set_room
        @room = Room.find(params[:id])
    end
    
    # autoriser tous les attributs de notre table Room
    def room_params
        params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_wifi, :is_tv, :is_closet, :is_shampoo, :is_breakfast, :is_heating, :is_air, :is_kitchen, :price, :active)
    end
    
    
end