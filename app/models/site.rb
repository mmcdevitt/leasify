class Site < ActiveRecord::Base
	belongs_to :user
	has_many :pages, :dependent => :destroy
	has_many :availabilities, :dependent => :destroy
	has_many :contacts, :dependent => :destroy
	has_many :theme_options, :dependent => :destroy
	has_many :property_informations, :dependent => :destroy
	validates :name, :subdomain, presence: true
	validates :subdomain, uniqueness: true

	accepts_nested_attributes_for :theme_options
	accepts_nested_attributes_for :property_informations
end
