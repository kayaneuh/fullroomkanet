module ApplicationHelper
    
    # def avatar_url(user) : permet l'affichage photo de profil
    def avatar_url(user)
        user.avatar.url
    end
    
end
