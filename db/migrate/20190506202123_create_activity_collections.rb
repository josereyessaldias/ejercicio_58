class CreateActivityCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_collections do |t|
      t.references :activity, foreign_key: true
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
