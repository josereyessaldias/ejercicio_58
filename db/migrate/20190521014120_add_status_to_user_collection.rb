class AddStatusToUserCollection < ActiveRecord::Migration[5.2]
  def change
    add_column :user_collections, :status, :integer
  end
end
