class CreatePromoteActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :promote_activities do |t|
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true
      t.decimal :amount, precision: 12, scale: 2
      t.boolean :payed

      t.timestamps
    end
  end
end
