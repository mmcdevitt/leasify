class Availability < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	validates :title, :suite_or_floor, :availability, :sf, :rental_rate, :content, presence: true
end
