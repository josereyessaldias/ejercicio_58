class ActuserPhoto < ApplicationRecord
  belongs_to :user_activity
  mount_uploader :photo, ActsusUploader
end
