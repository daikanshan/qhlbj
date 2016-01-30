class CreateAdminCultures < ActiveRecord::Migration
  def change
    create_table :admin_cultures,options:"charset=utf8" do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
