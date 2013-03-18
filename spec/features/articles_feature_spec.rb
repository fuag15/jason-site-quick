require 'spec_helper'

describe "index page" do
  before(:each) do
    @art1 = FactoryGirl.create :article
    @art2 = FactoryGirl.create :article
    visit articles_path
  end

  it "sets nav of blog to be active" do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  it "displays an article name" do
    expect(page).to have_content @art1.name
  end
end