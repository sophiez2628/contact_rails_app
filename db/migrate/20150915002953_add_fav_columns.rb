class AddFavColumns < ActiveRecord::Migration
  def change
    add_column :contacts, :favorites, :boolean
    add_column :contact_shares, :favorites, :boolean
  end
end
