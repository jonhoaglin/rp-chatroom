class Room < ActiveRecord::Base
  belongs_to :group
  has_many :messages
  has_many :participants
  has_many :characters, through: :participants

  acts_as_taggable

  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false, scope: :group_id }
end
