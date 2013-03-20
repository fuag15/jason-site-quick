require 'spec_helper'

feature 'index page' do
  background do
    @image = FactoryGirl.create :image_with_article
    visit article_images_path @image.article
  end

  scenario 'displays an image name' do
    expect(page).to have_content @image.name
  end
end

feature 'new page' do
  background do
    @article = FactoryGirl.create :article
    auth_admin
    visit new_article_image_path @article
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq new_article_image_path @article
  end

  scenario 'should create a new article successfully from form' do
    fill_in 'image_name', with: Forgery(:lorem_ipsum).word
    attach_file 'image_file', Rails.root.join('spec/support/images/waterdrop.jpg')
    click_button 'Create Image'
    expect(page).to have_content 'Image Created'
  end
end

feature 'edit page' do
  background do
    @image = FactoryGirl.create :image_with_article
    auth_admin
    visit edit_article_image_path(@image.article, @image)
  end

  scenario 'should not redirect me when visited' do
    expect(current_path).to eq edit_article_image_path(@image.article, @image)
  end
end

feature 'show page' do
  background do
    @image = FactoryGirl.create :image_with_article
    auth_admin
    visit article_image_path(@image.article, @image)
  end

  scenario 'should allow me to delete the image' do
    article = @image.article
    click_button 'destroy'
    expect(current_path).to eq article_images_path article
    expect(page).to have_content 'Image Successfully Deleted'
  end
end