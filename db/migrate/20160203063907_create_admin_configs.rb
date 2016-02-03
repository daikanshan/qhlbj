class CreateAdminConfigs < ActiveRecord::Migration
  def change
    create_table :admin_configs,options:"charset=utf8" do |t|
      t.string :name
      t.string :avatar
      t.integer :val
      t.string :url

      t.timestamps null: false
    end
  end
end
