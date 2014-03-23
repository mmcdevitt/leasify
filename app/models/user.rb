class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# validates_format_of :username, with: /^[a-z0-9_]+$/, message: "must be lowercase alphanumerics only"
	validates_length_of :username, maximum: 32, message: "exceeds maximum of 32 characters"
	validates_exclusion_of :username, in: ['www', 'mail', 'ftp'], message: "is not available"
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true, 
							 uniqueness: true
	has_many :posts, :dependent => :destroy
	has_many :pages, :dependent => :destroy
	has_many :availabilities, :dependent => :destroy
	has_many :contacts, :dependent => :destroy
	has_many :property_informations, :dependent => :destroy
	has_many :theme_options, :dependent => :destroy
	has_many :theme_names, :dependent => :destroy
	has_many :sites, :dependent => :destroy
	has_many :availability_galleries, :dependent => :destroy
	has_many :homepage_galleries, :dependent => :destroy
end
