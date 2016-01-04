class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users,options:"charset=utf8" do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
