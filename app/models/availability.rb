class Availability < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	validates :title, :suite_or_floor, :availability, :sf, :rental_rate, :content, :floor_location, :type_of_space, presence: true
	validates :sf, :rental_rate, :floor_location, numericality: true
end
