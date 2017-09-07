class ReservationsController < ApplicationController
    
    # pour faire une réservation il faut être authentifié
    before_action :authenticate_user!
    
    
    def preload
       room = Room.find(params[:room_id])
       today = Date.today
       # date de réservation début et fin plus tard que la date d'aujourd'hui
       reservations = room.reservations.where("start_date >= ? OR end_date >= ?", today, today)
       
       render json: reservations
    end
    
      def preview
        start_date = Date.parse(params[:start_date])
        end_date = Date.parse(params[:end_date])
        output = {
            conflict: is_conflict(start_date, end_date)
        }
        render json: output
    end
    
    # méthode de création d'une réservation par le current user
    # redirection vers la page de réservation
    def create
    @reservation = current_user.reservations.create(reservation_params)       
    redirect_to @reservation.room, notice: "Votre réservation a été acceptée"
    end
    
    def your_trips
       @trips = current_user.reservations 
    end

    def your_reservations
      @rooms = current_user.rooms
    end
  
private
     # on ne met pas user_id car la personne qui réserve est le current_user
     def reservation_params         
        params.require(:reservation).permit(:start_date, :end_date, :price, :total, :room_id)     
     end 
     
     def is_conflict(start_date, end_date)
        room = Room.find(params[:room_id])

        check = room.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
        check.size > 0? true : false
    end
end