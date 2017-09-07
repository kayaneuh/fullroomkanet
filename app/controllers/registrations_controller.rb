class RegistrationsController < Devise::RegistrationsController

    # def update_resource : accepter maj params d'un user sans renseigner le mot de passe
    protected
    def update_resource(resource, params)
        resource.update_without_password(params)
    end

end