require 'spec_helper'

describe "index page" do
  before :each do
    @article = FactoryGirl.create :article
    visit articles_path
  end

  it "sets nav of blog to be active" do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  it "displays an article name" do
    expect(page).to have_content @article.name
  end
end

describe "new page" do
  before :each do
    auth_admin
    visit new_article_path
  end

  it "sets nav of blog to be active" do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  it "should not redirect me when visited" do
    expect(current_path).to eq new_article_path
  end
end

describe "edit page" do
  before :each do
    @article = FactoryGirl.create :article
    auth_admin
    visit edit_article_path @article
  end

  it "sets nav of blog to be active" do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  it "should not redirect me when visited" do
    expect(current_path).to eq edit_article_path(@article)
  end
end

describe "show page" do
  before :each do
    @article = FactoryGirl.create :article
    auth_admin
    visit article_path @article
  end

  it "should allow me to delete the article" do
    click_button "destroy"
    expect(current_path).to eq articles_path
    expect(page).to have_content 'Article Successfully Deleted'
  end
end