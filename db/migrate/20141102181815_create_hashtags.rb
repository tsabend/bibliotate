class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :tag
      t.references :user, index: true
      t.references :comment, index: true

      t.timestamps
    end
  end
end
