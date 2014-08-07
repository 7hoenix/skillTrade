class Post < ActiveRecord::Base
	belongs_to :user
	has_many :bids, through: :user

	validates :title, presence: true
	
end
