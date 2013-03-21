# this is a catch all class for our static routes
# [index]   Splash type page
# [contact] Simple contact form
# [submit]  Post for for contact
# [about]   Simple about spage
# #contact uses ContactMailer#contact
class PagesController < ApplicationController
  skip_authorization_check

  def index
  end

  def contact
  end

  def submit
    ContactMailer.contact(params[:from], params[:text]).deliver
    redirect_to contact_pages_path, notice: 'Contact mail sent'
  end

  def about
  end
end
