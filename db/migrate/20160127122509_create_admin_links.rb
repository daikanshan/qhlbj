class CreateAdminLinks < ActiveRecord::Migration
  def change
    create_table :admin_links,options:"charset=utf8" do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
