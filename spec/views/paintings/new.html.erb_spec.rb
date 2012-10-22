require 'spec_helper'

describe "paintings/new" do
  before(:each) do
    assign(:painting, stub_model(Painting,
      :product_id => 1,
      :image => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new painting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paintings_path, :method => "post" do
      assert_select "input#painting_product_id", :name => "painting[product_id]"
      assert_select "input#painting_image", :name => "painting[image]"
      assert_select "input#painting_name", :name => "painting[name]"
    end
  end
end
