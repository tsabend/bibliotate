class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.references :story, index: true

      t.timestamps
    end
  end
end
