class AddHasSecure < ActiveRecord::Migration
  def change
    remove_column :users, :password_salt
    remove_column :users, :password_hash
    add_column :users, :password_digest, :string
  end
end
