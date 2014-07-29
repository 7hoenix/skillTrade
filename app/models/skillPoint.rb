class SkillPoint < ActiveRecord::Base
		belongs_to :user

		validates :presence: true

	end