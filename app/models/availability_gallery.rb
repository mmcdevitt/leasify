class AvailabilityGallery < ActiveRecord::Base
	belongs_to :user
	belongs_to :availability
  validates :availability_image, presence: true
	has_attached_file :availability_image, :default_url => "/assets/image.jpg", styles: {

    large: "848x600#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"

  },
  :storage => :s3,
  :bucket => ENV['LEASIFY'],
  :s3_credentials => File.join(Rails.root, 'config', 'application.yml')

	validates_attachment_content_type :availability_image, :content_type => /\Aimage/
end
