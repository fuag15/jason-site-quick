# this module helpes Image Pages by
# smartly determining the route for an images owner
# this is required because images are possibly owned by two classes
module ImageHelper
  # return the right edit path
  # since we are multi using this model
  def owner_aware_edit_image_path owner, image
    if owner.class.to_s == 'Article'
      edit_article_image_path owner, image
    else
      edit_project_image_path owner, image
    end
  end

  # return the right index path
  # since we are sharing this model
  def owner_aware_images_path owner
    if owner.class.to_s == 'Article'
      article_images_path owner
    else
      project_images_path owner
    end
  end

  # return the right new path
  # needed since this is a shared model
  def owner_aware_new_image_path owner
    if owner.class.to_s == 'Article'
      new_article_image_path owner
    else
      new_project_image_path owner
    end
  end
end