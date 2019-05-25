class AddTitleToUserActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :user_activities, :title, :string
  end
end
