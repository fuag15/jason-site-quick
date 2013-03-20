require 'spec_helper'

describe ImageHelper do
  before :each do
    @image = FactoryGirl.create :image_with_article
    @article = @image.article
  end

  describe 'owner_aware_edit_image_path' do
    it 'should return edit_article_image_path when passed article' do
      expect( owner_aware_edit_image_path(@article, @image)).to eq edit_article_image_path(@article, @image)
    end
  end

  describe 'owner_aware_images_path' do
    it 'should return edit_article_images_path when passed article' do
      expect( owner_aware_images_path @article ).to eq article_images_path @article
    end
  end

  describe 'owner_aware_new_image_path' do
    it 'should return new_article_image_path when passed article' do
      expect( owner_aware_new_image_path @article).to eq new_article_image_path @article
    end
  end
end
