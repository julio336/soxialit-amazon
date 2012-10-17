require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :title => "Title",
        :description => "MyText",
        :color => "Color",
        :material => "Material",
        :picture => "Picture",
        :refund_policy => "Refund Policy",
        :size => "Size",
        :quantity => 1,
        :user_id => 2
      ),
      stub_model(Product,
        :title => "Title",
        :description => "MyText",
        :color => "Color",
        :material => "Material",
        :picture => "Picture",
        :refund_policy => "Refund Policy",
        :size => "Size",
        :quantity => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Material".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => "Refund Policy".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
