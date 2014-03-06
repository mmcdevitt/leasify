class Page < ActiveRecord::Base
	belongs_to :user
	validates :title, :subtitle, :content, presence: true

	has_attached_file :page_image, :default_url => "/assets/image.jpg", styles: {

    large: "848x600#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "80x80#"

  }
	validates_attachment_content_type :page_image, :content_type => /\Aimage/
end
