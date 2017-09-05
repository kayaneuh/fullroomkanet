class UsersController < ApplicationController
    
    # variable @user qui va permettre de trouver dans la base de données l’utilisateur correspondant à un ID (celui de l'url: users/id) et l’afficher dans nos vues plus tard (sur la page show.html.erb). 
     def show
        @user = User.find(params[:id])
     end
end 