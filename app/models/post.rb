class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	belongs_to :user

	before_create :create_slug

  def to_param
    slug
  end

  def create_slug
    self.slug = self.title.parameterize

    if Post.exists?(slug: self.slug)
    	posts = Post.where(title: self.title).count
    	self.slug = self.title.parameterize + "-" + (posts + 1).to_s
    end
  end

end
