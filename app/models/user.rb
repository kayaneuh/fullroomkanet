class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # validates +attribut (ici :fullname) permet d'ajouter les critères de validation de l'ajout d'une entrée pour l'attribut fullname de la table User
  # presence: true valide la création d'un nouvel utilisateur si et seulement si le champ fullname est rempli
  # length: {maximum: 65}, on ajoute un critère de validation, ici un nombre maximum de caractères, au delà, ça renvoie une erreur et ne créé pas le nouvel utilisateur.
  
  validates :fullname, presence: true, length: {maximum: 65}
  
  # has_attached_file :avatar signifie qu'on attache un fichier à l'attribut avatar
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ signifie que qu'on accepte tout format photo
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/default_image.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  # ajouter l'attribut image/avatar sur le model User
  # --> rails generate paperclip user avatar 
  
  # un user peut avoir plusieurs annonces (rooms)
  has_many :rooms
  has_many :reservations
end
