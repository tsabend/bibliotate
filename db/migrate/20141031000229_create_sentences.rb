class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.belongs_to :story
      t.text :body

      t.timestamps
    end
  end
end
