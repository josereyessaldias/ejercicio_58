class AddPhotoToCollection < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :photo, :string
  end
end
