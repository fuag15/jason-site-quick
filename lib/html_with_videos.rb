# simple class to also render videos with double emphasis
class HTMLWithVideos < Redcarpet::Render::HTML
  # should add small / medium / large sizes that pass width / set max width
  def double_emphasis text
    # match size
    if text.match '/ \(.*large.*\)$/'
      width = 500
    elsif text.match '/ \(.*small.*\)$/'
      width = 300
    else
      width = 400
    end
    # match float
    if text.match '/ \(.*right.*\)$/'
      pull = 'pull-right'
    elsif text.match '/ \(.*left.*\)$/'
      pull = 'pull-left'
    else
      pull = ''
    end
    text.gsub! '/ \(.*\)$/', ''
    if text.match /^video / and Video.where(name: text.gsub(/^video /,'')).present?
      "<div class='embeded-video #{pull}'>#{Video.where(name: text.gsub(/^video /,'')).first.iframe(width)}</div>"
    elsif text.match /^image / and Image.where(name: text.gsub(/^image /,'')).present?
      "<img src='#{Image.where(name: text.gsub(/^image /,'')).first.file.url}' class='embeded-image #{pull}', max-width='#{width}px'></img>"
    else
      "ERROR PARSING #{text}"
    end
  end
end