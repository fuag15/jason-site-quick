require 'spec_helper'

describe User do
  it 'says its an admin if its an admin' do
    admin = FactoryGirl.create :user, role: 'admin'
    expect(admin.admin?).to eq true
  end

  it 'says its not an admin if it isnt an admin' do
    admin = FactoryGirl.create :user
    expect(admin.admin?).to eq false
  end
end