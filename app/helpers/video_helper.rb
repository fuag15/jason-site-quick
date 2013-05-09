# this module helpes Video Pages by
# smartly determining the route for an videos owner
# this is required because videos are possibly owned by two classes
module VideoHelper
  # return the right edit path
  # since we are multi using this model
  def owner_aware_edit_video_path owner, video
    if owner.class.to_s == 'Article'
      edit_article_video_path owner, video
    else
      edit_project_video_path owner, video
    end
  end

  # return the right index path
  # since we are sharing this model
  def owner_aware_videos_path owner
    if owner.class.to_s == 'Article'
      article_videos_path owner
    else
      project_videos_path owner
    end
  end

  # return the right new path
  # needed since this is a shared model
  def owner_aware_new_video_path owner
    if owner.class.to_s == 'Article'
      new_article_video_path owner
    else
      new_project_video_path owner
    end
  end
end