require 'spec_helper'

describe "paintings/show" do
  before(:each) do
    @painting = assign(:painting, stub_model(Painting,
      :product_id => 1,
      :image => "Image",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Image/)
    rendered.should match(/Name/)
  end
end
