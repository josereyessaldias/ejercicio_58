class AddParticipioToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :participio, :string
  end
end
