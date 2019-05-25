class AddPastToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :past, :string
  end
end
