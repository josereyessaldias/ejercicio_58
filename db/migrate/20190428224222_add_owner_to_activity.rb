class AddOwnerToActivity < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :owner, foreign_key: false
  end
end
