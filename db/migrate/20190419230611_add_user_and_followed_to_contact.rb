class AddUserAndFollowedToContact < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :user, foreign_key: true
    add_reference :contacts, :followed, foreign_key: false
  end
end
