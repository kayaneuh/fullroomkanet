class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # validates +attribut (ici :fullname) permet d'ajouter les critères de validation de l'ajout d'une entrée pour l'attribut fullname de la table User
  # presence: true valide la création d'un nouvel utilisateur si et seulement si le champ fullname est rempli
  # length: {maximum: 65}, on ajoute un critère de validation, ici un nombre maximum de caractères, au delà, ça renvoie une erreur et ne créé pas le nouvel utilisateur.
  
  validates :fullname, presence: true, length: {maximum: 65}
  
end
