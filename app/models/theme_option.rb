class ThemeOption < ActiveRecord::Base
	belongs_to :user

	has_attached_file :theme_image, :default_url => "/assets/image.jpg", styles: {

    large: "848x600#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "80x80#"

  }
	validates_attachment_content_type :theme_image, :content_type => /\Aimage/

	has_attached_file :homepage_image, :default_url => "/assets/image.jpg", styles: {

    large: "848x600#",
    medium: "300x200#",
    small: "140x140#",
    thumb: "80x80#"

  }
	validates_attachment_content_type :homepage_image, :content_type => /\Aimage/
end
