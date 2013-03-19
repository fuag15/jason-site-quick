# this file is read by heroku and foreman for production, 
# default port is 5000, should use rails s for development
web: bundle exec unicorn -p $PORT -E $RACK_ENV

# host our docs on port 3001:/doc/app
doc: bundle exec ruby -r webrick -e "s = WEBrick::HTTPServer.new(Port: 3001, DocumentRoot: File.join(Dir.pwd, 'doc, 'app')); trap('INT') { s.shutdown }; s.start"

# host normal server for development and nice warnings
development: bundle exec rails s