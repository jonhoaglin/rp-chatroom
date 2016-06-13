class Group < ActiveRecord::Base
  belongs_to :universe
  has_many :rooms
  has_many :members
  has_many :users, through: :members

  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false, scope: :universe_id }
end
