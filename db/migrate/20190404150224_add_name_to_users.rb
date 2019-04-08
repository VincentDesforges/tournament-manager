class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, default: "New User"
    User.update_all(name: "New User")
  end
end
