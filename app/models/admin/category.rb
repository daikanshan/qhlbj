class Admin::Category < ActiveRecord::Base
  has_many :subcategories, class_name:"Admin::Category",
                            foreign_key: "supcategory_id"
  belongs_to :supcategory, class_name:"Admin::Category"

  has_many :products
  before_destroy :handle_category

  def handle_category
    mr = Admin::Category.find_by_name("默认")
    products.each do |p|
      mr.products << p
    end
  end
end
