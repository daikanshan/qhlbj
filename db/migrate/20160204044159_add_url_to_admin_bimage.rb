class AddUrlToAdminBimage < ActiveRecord::Migration
  def change
    add_column :admin_bimages, :url, :string
  end
end
