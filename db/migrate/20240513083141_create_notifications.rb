class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :content
      t.string :on_click_url
      t.time :sent_at

      t.timestamps
    end
  end
end
