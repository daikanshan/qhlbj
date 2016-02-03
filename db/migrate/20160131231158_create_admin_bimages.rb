class CreateAdminBimages < ActiveRecord::Migration
  def change
    create_table :admin_bimages,options:"charset=utf8" do |t|
      t.string :title
      t.string :avatar
      t.integer :shown
      t.text :abstract

      t.timestamps null: false
    end
  end
end
