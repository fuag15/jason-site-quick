# simple class to also render videos with double emphasis
class HTMLWithVideos < Redcarpet::Render::HTML
  def double_emphasis text
    if text.match /^video / and Video.where(name: text.gsub(/^video /,'')).present?
      "<div class='embeded-video'>#{Video.where(name: text.gsub(/^video /,'')).first.iframe}</div>"
    elsif text.match /^image / and Image.where(name: text.gsub(/^image /,'')).present?
      "<img src='#{Image.where(name: text.gsub(/^image /,'')).first.file.url}' class='embeded-image'></img>"
    else
      "ERROR PARSING #{text}"
    end
  end
end