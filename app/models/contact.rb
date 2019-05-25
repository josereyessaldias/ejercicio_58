class Contact < ApplicationRecord
	belongs_to :user, class_name: 'User', foreign_key: 'user_id'
	belongs_to :followed, class_name: 'User', foreign_key: 'user_id'

	attribute :blocked, :boolean, default: false

	validate :user_different_from_followed

	def user_different_from_followed
		if self.user_id == self.followed_id
			errors.add(:base, 'a must be different to b')
		end
	end
end
