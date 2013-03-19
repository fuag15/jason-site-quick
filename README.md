#Jason's Midgard Production Portfolio Site

Site to demo Midgar Productions projects etc, server urls to come

##Detailed Docs

- [app specific][local-rdoc]
- [New to rails?][rails-rdoc]

##Local Install

This package is set up to use some external tools:

- [git-flow][git-flow]
- [rvm][rvm]
- [postgresql][postgresql]

First you will need to set up a postgresql user for the database:

    sudo -u postgres createuser --createdb --pwprompt mildwurm
    # make password mildwurm
    # make superuser

To set up a local env clone and cd into cloned directory then:

    bundle install
    rake db:setup
    rails s

You should be able to view the site on `localhost:3000`, or [here][local-host]

##Current Hosts

- [staging][staging-heroku]

##Dev Guidlines

- Use git flow
- Use the issue tracker
- Comment
- Test
- Keep docs up to date!

##Roadmap

- Basic site with crud functionality
- Vimeo rating / viewer in d3.js -> gem
- markdown for articles -> redcarpet2 with extensions
- Front end design
- Work with jason on hosting

[staging-heroku]: http://midgard-productions.herokuapp.com "Heroku staging sever"
[local-host]: http://localhost:3000 "Local default server port"
[postgresql]: http://postgresql.org "Postgresql Official Site"
[rvm]: http://rvm.io "Ruby Versioning Manager Official Site"
[git-flow]: http://github.com/nvie/gitflow "Git-flow plugin page"
[local-rdoc]: doc/app/doc/README_FOR_APP.html "Local generated rdoc"
[rails-rdoc]: rails_primer.rdoc "Local rails default doc"