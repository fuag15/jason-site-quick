task :publish_doc do 
  require 'grancher/task'
  Grancher::Task.new do |g|
    g.branch = 'gh-pages'
    g.push_to = 'origin'
    g.message = 'Updated rdoc'
    g.directory 'doc/app'
  end
end
