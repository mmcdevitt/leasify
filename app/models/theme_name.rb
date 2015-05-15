class ThemeName < ActiveRecord::Base
	belongs_to :user

	has_attached_file :theme_name_image, :default_url => "/assets/image.jpg", styles: {

    large: "848x600#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"

  },
  :storage => :s3,
  :bucket => ENV['LEASIFY'],
  :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
	validates_attachment_content_type :theme_name_image, :content_type => /\Aimage/

  scope :published, -> { where(published: true).all }
end
