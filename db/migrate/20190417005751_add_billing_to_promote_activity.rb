class AddBillingToPromoteActivity < ActiveRecord::Migration[5.2]
  def change
    add_reference :promote_activities, :billing, foreign_key: true
  end
end
