# this is a catch all class for our static routes
# [index]   Splash type page
# [contact] Simple contact form
# [submit]  Post for for contact
# [about]   Simple about spage
# #contact uses ContactMailer#contact
class PagesController < ApplicationController
  skip_authorization_check

  # this method handles input from the contact form
  # shoots off a mail from ContactMailer#contact
  def submit
    local_params = params
    ContactMailer.contact(local_params[:from], local_params[:text]).deliver
    redirect_to contact_path, notice: 'Contact mail sent'
  end
end
