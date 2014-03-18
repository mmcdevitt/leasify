class HomepageGallery < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	belongs_to :theme_option
	has_attached_file :homepage_gallery_image, :default_url => "/assets/image.jpg", styles: {

    large: "1200x650#",
    medium: "300x200#",
    small: "140x140#",
    thumb: "140x140#"

  },
  :storage => :s3,
  :bucket => ENV['LEASIFY'],
  :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
	validates_attachment_content_type :homepage_gallery_image, :content_type => /\Aimage/




end
