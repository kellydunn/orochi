run "echo \"gem 'odin'\" >> Gemfile"
run "rake db:create:all >> /dev/null"
run "rake db:migrate >> /dev/null"
run "rake odin:awaken >> /dev/null"
