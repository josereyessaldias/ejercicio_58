class AddNameAndBirthAndRoleAndCountryAndCityToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :birth, :date
    add_column :users, :role, :integer
    add_column :users, :country, :string
    add_column :users, :city, :string
  end
end
