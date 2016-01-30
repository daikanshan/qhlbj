class AddNameToAdminMessages < ActiveRecord::Migration
  def change
    add_column :admin_messages, :name, :string
  end
end
