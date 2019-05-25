class PromoteActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :billing, optional: true

  attribute :payed, :boolean, default: false

  validates :amount, :activity_id, presence: true

end
