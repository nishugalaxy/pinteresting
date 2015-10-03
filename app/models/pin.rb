class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image,
                  :styles => { :medium => "460x>", :thumb => "100x100>",:vnice=> "400x" },
                  :storage => :s3,
                  :bucket => 'sevaniketan',
                  :s3_credentials => "#{Rails.root}/config/aws.yml",
                  :path => "resources/:id/:style/:basename.:extension"
	        
	validates :image, presence: true
	validates :description, presence: true
end
