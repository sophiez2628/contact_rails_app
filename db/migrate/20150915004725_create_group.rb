class CreateGroup < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :group_name
    end

    add_column :contacts, :group_id, :integer
  end
end
