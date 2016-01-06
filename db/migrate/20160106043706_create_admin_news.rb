class CreateAdminNews < ActiveRecord::Migration
  def change
    create_table :admin_news,options:"charset=utf8" do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
