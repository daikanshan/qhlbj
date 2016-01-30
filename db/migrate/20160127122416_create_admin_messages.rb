class CreateAdminMessages < ActiveRecord::Migration
  def change
    create_table :admin_messages,options:"charset=utf8" do |t|
      t.string :contact
      t.text :content

      t.timestamps null: false
    end
  end
end
