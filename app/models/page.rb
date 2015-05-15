class Page < ActiveRecord::Base
  extend FriendlyId

  acts_as_tree

	belongs_to :user
	belongs_to :site
	validates :title, :subtitle, :content, presence: true
	validate :validate_leasing

  has_attached_file :page_image, :default_url => "/assets/office1.jpg", styles: {
		xlarge: "1200x800#",
    large: "1200x800#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"
  },
  :storage => :s3,
  :bucket => ENV['LEASIFY'],
  :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
	validates_attachment_content_type :page_image, :content_type => /\Aimage/

  friendly_id :title, use: :slugged

  scope :featured, -> (site) { where(site_id: site, published: true, feature_on_homepage: true).all }
  scope :root,     -> (site) { where(site_id: site, published: true).roots.all(:order => "position") }

  # Can't allow users to create a page called leasing
  def validate_leasing
    if self.title.downcase == "leasing" || self.title.downcase == "leasings"
      errors.add(:title, "can not be called 'Leasing' because a Leasing page has automatically been generated when you created this site.")
    end
  end
end







































