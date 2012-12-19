require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :uid => "Uid",
      :paid => 1.5,
      :remember_token => "Remember Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Uid/)
    rendered.should match(/1.5/)
    rendered.should match(/Remember Token/)
  end
end
