class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# validates_format_of :username, with: /^[a-z0-9_]+$/, message: "must be lowercase alphanumerics only"
	validates_length_of :username, maximum: 32, message: "exceeds maximum of 32 characters"
	validates_exclusion_of :username, in: ['www', 'mail', 'ftp'], message: "is not available"
	has_many :posts
	has_many :pages
	has_many :availabilities
	has_many :contacts
	has_many :property_informations
	has_many :theme_options
	has_many :theme_names
	has_many :sites
end
