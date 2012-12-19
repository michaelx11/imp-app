require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :uid => "Uid",
        :paid => 1.5,
        :remember_token => "Remember Token"
      ),
      stub_model(User,
        :name => "Name",
        :uid => "Uid",
        :paid => 1.5,
        :remember_token => "Remember Token"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Remember Token".to_s, :count => 2
  end
end
