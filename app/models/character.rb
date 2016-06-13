class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :universe
  has_many :messages, as: :speaker
  has_many :participants
  has_many :rooms, through: :participants
  has_many :char_pictures

  has_attached_file :avatar, styles: {full:"100x100#", thumb:"50x50#", icon:"25x25#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
