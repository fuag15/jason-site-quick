require 'spec_helper'

describe "articles/edit" do
  it "renders _form partial for the article" do
    article = FactoryGirl.create :article
    assign(:article, article)
    render
    expect(view).to render_template( partial: "_form")
  end
end

describe "articles/new" do
  it "displays the event location" do
    article = FactoryGirl.build :article
    assign(:article, article)
    render
    expect(view).to render_template( partial: "_form")
  end
end