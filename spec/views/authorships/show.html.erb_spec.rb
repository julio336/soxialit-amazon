require 'spec_helper'

describe "authorships/show" do
  before(:each) do
    @authorship = assign(:authorship, stub_model(Authorship,
      :product_id => 1,
      :size_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
