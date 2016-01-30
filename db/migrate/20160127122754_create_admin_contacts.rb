class CreateAdminContacts < ActiveRecord::Migration
  def change
    create_table :admin_contacts,options:"charset=utf8" do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :fixed_phone
      t.string :address

      t.timestamps null: false
    end
  end
end
