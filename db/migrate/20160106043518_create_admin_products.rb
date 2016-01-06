class CreateAdminProducts < ActiveRecord::Migration
  def change
    create_table :admin_products,options:"charset=utf8" do |t|
      t.string :name
      t.integer :category_id
      t.text :describe
      t.string :img_url

      t.timestamps null: false
    end
  end
end
