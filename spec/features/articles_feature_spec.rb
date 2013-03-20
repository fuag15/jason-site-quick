require 'spec_helper'

feature 'index page' do
  background do
    @article = FactoryGirl.create :article
    visit articles_path
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'displays an article name' do
    expect(page).to have_content @article.name
  end
end

feature 'new page' do
  background do
    auth_admin
    visit new_article_path
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_article_path
  end
end

feature 'edit page' do
  background do
    @article = FactoryGirl.create :article
    auth_admin
    visit edit_article_path @article
  end

  scenario 'sets nav of blog to be active' do
    expect(page).to have_selector 'ul.nav .active', text: 'Blog'
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_article_path(@article)
  end
end

feature 'show page' do
  background do
    @article = FactoryGirl.create :article
    auth_admin
    visit article_path @article
  end

  scenario 'should allow me to delete the article' do
    click_button 'destroy'
    expect(current_path).to eq articles_path
    expect(page).to have_content 'Article Successfully Deleted'
  end
end