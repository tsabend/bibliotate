class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.belongs_to :paragraph
      t.text :body

      t.timestamps
    end
  end
end
