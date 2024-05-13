class AddReferencesToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_reference :notifications, :user, null: false, foreign_key: true
    add_reference :notifications, :match, null: false, foreign_key: true
  end
end
