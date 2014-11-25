class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :photo
      t.string :role
      t.string :oauthtoken
      t.string :oauthrefresh

      t.timestamps
    end
  end
end
