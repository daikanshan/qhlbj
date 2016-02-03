class AddAvatarToAdminProducts < ActiveRecord::Migration
  def change
    add_column :admin_products, :avatar, :string
  end
end
