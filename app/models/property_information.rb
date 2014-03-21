class PropertyInformation < ActiveRecord::Base
	belongs_to :user
	belongs_to :site

	validates :name, presence: true


end
