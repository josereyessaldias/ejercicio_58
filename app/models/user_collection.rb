class UserCollection < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  validates :user_id, uniqueness: { scope: :collection_id,
    message: "Error" }

  enum status: [:siguiendo, :completa]
end
