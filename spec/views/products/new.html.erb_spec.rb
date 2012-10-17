require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :title => "MyString",
      :description => "MyText",
      :color => "MyString",
      :material => "MyString",
      :picture => "MyString",
      :refund_policy => "MyString",
      :size => "MyString",
      :quantity => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_title", :name => "product[title]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_color", :name => "product[color]"
      assert_select "input#product_material", :name => "product[material]"
      assert_select "input#product_picture", :name => "product[picture]"
      assert_select "input#product_refund_policy", :name => "product[refund_policy]"
      assert_select "input#product_size", :name => "product[size]"
      assert_select "input#product_quantity", :name => "product[quantity]"
      assert_select "input#product_user_id", :name => "product[user_id]"
    end
  end
end
