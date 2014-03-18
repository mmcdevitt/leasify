class ThemeOption < ActiveRecord::Base
	belongs_to :user
    belongs_to :site
    has_many :homepage_galleries
    accepts_nested_attributes_for :homepage_galleries, 
                                 reject_if: proc { |attributes| attributes['homepage_gallery_image'].blank? }, 
                                 allow_destroy: true

	has_attached_file :theme_image, :default_url => "/assets/image.jpg", styles: {

    large: "848x600#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "105x105#"

  },
  :storage => :s3,
  :s3_credentials => {
    :bucket => ENV['LEASIFY'],
    :access_key_id => ENV['AKIAIK7L57MTKL3JUDRA'],
    :secret_access_key => ENV['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']
  }
	validates_attachment_content_type :theme_image, :content_type => /\Aimage/

	
end
