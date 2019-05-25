class CreateActuserPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :actuser_photos do |t|
      t.references :user_activity, foreign_key: true
      t.string :comment
      t.string :photo

      t.timestamps
    end
  end
end
