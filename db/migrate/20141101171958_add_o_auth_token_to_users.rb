class AddOAuthTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauthtoken, :string
  end
end

