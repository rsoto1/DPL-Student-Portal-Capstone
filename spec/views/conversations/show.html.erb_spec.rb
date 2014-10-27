require 'rails_helper'

RSpec.describe "conversations/show", :type => :view do
  before(:each) do
    @conversation = assign(:conversation, Conversation.create!(
      :board => nil,
      :user => nil,
      :title => "Title",
      :last_commenter_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
  end
end
