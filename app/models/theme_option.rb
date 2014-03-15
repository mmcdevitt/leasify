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

  }
	validates_attachment_content_type :theme_image, :content_type => /\Aimage/

	
end
