require 'spec_helper'

describe "authorships/new" do
  before(:each) do
    assign(:authorship, stub_model(Authorship,
      :product_id => 1,
      :size_id => 1
    ).as_new_record)
  end

  it "renders new authorship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => authorships_path, :method => "post" do
      assert_select "input#authorship_product_id", :name => "authorship[product_id]"
      assert_select "input#authorship_size_id", :name => "authorship[size_id]"
    end
  end
end
