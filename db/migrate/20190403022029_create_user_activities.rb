class CreateUserActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_activities do |t|
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.integer :status

      t.timestamps
    end
  end
end
