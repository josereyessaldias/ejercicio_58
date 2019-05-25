class Activity < ApplicationRecord
	has_many :user_activity, dependent: :destroy
	has_many :users, through: :user_activity, dependent: :destroy

	belongs_to :category, optional: true
	has_many :promote_activity, dependent: :destroy

	belongs_to :user, class_name: 'User', foreign_key: :owner_id

	mount_uploader :photo, ImageUploader

	has_many :activity_collection, dependent: :destroy
	has_many :collections, through: :activity_collection, dependent: :destroy
end
