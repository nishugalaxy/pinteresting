class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
   	:storage => :s3,
                  :bucket => 'sevaniketan',
                  :s3_credentials => "#{Rails.root}/config/aws.yml",
                  :path => "resources/:id/:style/:basename.:extension"
	validates :image, presence: true
	validates :description, presence: true
end
