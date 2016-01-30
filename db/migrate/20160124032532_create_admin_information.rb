class CreateAdminInformation < ActiveRecord::Migration
  def change
    create_table :admin_information,options:"charset=utf8" do |t|
      t.string :title
      t.text :content
      t.integer :tp

      t.timestamps null: false
    end
  end
end
