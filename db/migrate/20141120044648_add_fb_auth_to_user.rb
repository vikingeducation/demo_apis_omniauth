class AddFbAuthToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_uid, :string
    add_column :users, :fb_provider, :string 
    add_column :users, :fb_token_expires, :datetime
    add_column :users, :fb_token, :string
  end
end
