class Billing < ApplicationRecord
  belongs_to :user
  has_many :promote_activity
end
