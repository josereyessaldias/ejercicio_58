class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :author
      t.string :place
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
