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
  :s3_credentials => {
    :bucket => ENV['LEASIFY'],
    :access_key_id => ENV['AKIAIK7L57MTKL3JUDRA'],
    :secret_access_key => ENV['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']
  }
	validates_attachment_content_type :homepage_gallery_image, :content_type => /\Aimage/




end
