class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :status, default: true
      t.references :noteable, polymorphic: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
