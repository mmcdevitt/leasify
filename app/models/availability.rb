class Availability < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	has_many :availability_galleries, :dependent => :destroy
	validates :title, :suite_or_floor, :availability, :sf, :rental_rate, :content, :floor_location, :type_of_space, presence: true
	validates :sf, :rental_rate, :floor_location, numericality: true

	accepts_nested_attributes_for :availability_galleries, 
																reject_if: proc { |attributes| attributes['availability_image'].blank? }, 
																allow_destroy: true
end
