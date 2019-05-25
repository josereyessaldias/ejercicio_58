class RemoveStartAndEndFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :start, :datetime
    remove_column :activities, :end, :datetime
  end
end
