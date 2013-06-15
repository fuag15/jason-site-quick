# simple class to also render videos with double emphasis
class HTMLWithVideos < Redcarpet::Render::HTML
  def double_emphasis text
    if text.match /^video /
      "<div class='embeded-video'>#{Video.where(name: text.gsub(/^video /,'')).first.iframe}</div>"
    elsif text.match /^image /
      "<img src='#{Image.where(name: text.gsub(/^image /,'')).first.file.url}' class='embeded-image'></img>"
    else
      "ERROR PARSING #{text}"
    end
  end
end