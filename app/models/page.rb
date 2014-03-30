class Page < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	validates :title, :subtitle, :content, presence: true
	validate :validate_leasing

	acts_as_tree

	# Can't allow users to create a page called leasing 
	def validate_leasing
		if self.title.downcase == "leasing" || self.title.downcase == "leasings"
			errors.add(:title, "can not be called 'Leasing' because a Leasing page has automatically been generated when you created this site.")
		end
	end

	has_attached_file :page_image, :default_url => "/assets/office1.jpg", styles: {
		xlarge: "1200x800#",
    large: "848x600#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"

  },
  :storage => :s3,
  :bucket => ENV['LEASIFY'],
  :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
	validates_attachment_content_type :page_image, :content_type => /\Aimage/

  # Create page slugs
	extend FriendlyId
	friendly_id :title, use: :slugged



   
end







































