class ReservationsController < ApplicationController
    
    # pour faire une réservation il faut être authentifié
    before_action :authenticate_user!
    
    # méthode de création d'une réservation par le current user
    # redirection vers la page de réservation
    def create
    @reservation = current_user.reservations.create(reservation_params)       
    redirect_to @reservation.room, notice: "Votre réservation a été acceptée"
    end

  
private
     # on ne met pas user_id car la personne qui réserve est le current_user
     def reservation_params         
        params.require(:reservation).permit(:start_date, :end_date, :price, :total, :room_id)     
     end 
end