require 'spec_helper'

describe 'index page' do
  it 'displays sign in on first view' do
    visit root_path
    expect(page).to have_content 'Sign In'
  end

  it 'displays username and sign out when logged in' do
    auth_admin
    visit root_path
    expect(page).to have_content @user.email
    expect(page).to have_content 'Log Out'
  end
end

describe 'about page' do
  it 'sets about nav to be active' do
    visit about_path
    expect(page).to have_selector 'ul.nav .active', text: 'about'
  end
end

describe 'contact page' do
  it 'sets contact nav to be active' do
    visit contact_path
    expect(page).to have_selector 'ul.nav .active', text: 'Contact'
  end
end