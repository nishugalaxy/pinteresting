class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => {:medium => "300x300>", :thumb => "100x100>"}
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	# do_not_validate_attachment_file_type :image
	validates :description, presence: true
	validates :image, presence: true
end
