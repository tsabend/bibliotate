class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :status, default: true
      t.references :noteable, polymorphic: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
