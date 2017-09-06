class Room < ActiveRecord::Base
  # une annonce room appartient à un utilisateur
  belongs_to :user
  has_many :photos
  
  
  # les caractéristiques obligatoires d'une annonce (room) pour qu'elle soit valide
  validates :home_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true
  validates :listing_name, presence: true, length: {maximum: 75}
  validates :summary, presence: true, length: {maximum: 600}
  validates :address, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 5 }
  
  # gem geocoder google map
  geocoded_by :address
  # si l'adresse change, geocode va convertir l'adresse en latitude longitude
  after_validation :geocode, if: :address_changed?
  
end
