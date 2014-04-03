class Availability < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	has_many :availability_galleries, :dependent => :destroy
	validates :title, :suite_or_floor, :subtitle, :availability, :sf, :rental_rate, :content, :floor_location, :type_of_space, presence: true
	validates :sf, :rental_rate, :floor_location, numericality: true
	validates :subtitle, length: {maximum: 120}
	accepts_nested_attributes_for :availability_galleries, 
																reject_if: proc { |attributes| attributes['availability_image'].blank? }, 
																allow_destroy: true

  has_attached_file :floorplan_image, :default_url => "/assets/office1.jpg", styles: {
		xlarge: "1200x800#",
    large: "848x600#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"

  },
  :storage => :s3,
  :bucket => ENV['LEASIFY'],
  :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
	validates_attachment_content_type :floorplan_image, :content_type => /\Aimage/																


end



