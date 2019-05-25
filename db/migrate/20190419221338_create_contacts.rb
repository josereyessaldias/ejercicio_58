class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.boolean :blocked

      t.timestamps
    end
  end
end
