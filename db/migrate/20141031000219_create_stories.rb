class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.belongs_to :course
      t.string :title
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
