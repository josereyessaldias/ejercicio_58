class AddFuturoToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :futuro, :string
  end
end
