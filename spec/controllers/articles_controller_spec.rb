require 'spec_helper'

describe ArticlesController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.code).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect('response').to render_template("index")
    end

    it "loads all of the articles into @articles" do
      art1 = FactoryGirl :create, :article
      art2 = FactoryGirl :create, :article
      get :index
      expect(assigns(:articles)).to match_array([art1, art2])
    end
  end
end
