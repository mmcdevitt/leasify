class Contact < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	validates :first_name, :last_name, :company, :job_title, :phone, :email, presence: true
	validates :phone, length: {maximum: 10}
end
