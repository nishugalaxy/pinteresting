class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins, dependent: :destroy

  validates :name, presence: true

  has_attached_file :image,
                  :styles => { :medium => "460x>", :thumb => "100x100>",:vnice=> "400x" },
                  :storage => :s3,
                  :bucket => 'sevaniketan',
                  :s3_credentials => "#{Rails.root}/config/aws.yml",
                  :path => "resources/:id/:style/:basename.:extension"
end
