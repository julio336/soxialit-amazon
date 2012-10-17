require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :title => "Title",
      :description => "MyText",
      :color => "Color",
      :material => "Material",
      :picture => "Picture",
      :refund_policy => "Refund Policy",
      :size => "Size",
      :quantity => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Color/)
    rendered.should match(/Material/)
    rendered.should match(/Picture/)
    rendered.should match(/Refund Policy/)
    rendered.should match(/Size/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
