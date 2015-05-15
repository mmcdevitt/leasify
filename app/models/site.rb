class Site < ActiveRecord::Base
	belongs_to :user
	has_many :pages, :dependent => :destroy
	has_many :availabilities, :dependent => :destroy
	has_many :contacts, :dependent => :destroy
	has_many :theme_options, :dependent => :destroy
	has_many :property_informations, :dependent => :destroy
	has_many :homepage_galleries, :dependent => :destroy

	validates :subdomain, presence: true,
                        uniqueness: true,
                        format: { with: /\A[a-zA-Z\-\d]+\z/i,
              						message: "Leasify URL's can only contain alphanumeric
              						characters and hyphens. No periods, underscores, or special characters."
                        }

	accepts_nested_attributes_for :theme_options
	accepts_nested_attributes_for :property_informations

  scope :subdomain, -> { where(subdomain: request.subdomain).first }
end


