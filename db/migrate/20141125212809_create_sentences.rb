class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.references :paragraph, index: true
      t.text :body

      t.timestamps
    end
  end
end
