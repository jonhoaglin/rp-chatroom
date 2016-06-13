class CharPicture < ActiveRecord::Base
  belongs_to :character
  belongs_to :picture_type

  has_attached_file :file, styles: {full:"100x100#", thumb:"50x50#", icon:"25x25#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
end
