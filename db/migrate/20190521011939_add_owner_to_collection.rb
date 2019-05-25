class AddOwnerToCollection < ActiveRecord::Migration[5.2]
  def change
    add_reference :collections, :owner, foreign_key: false
  end
end
