run "echo \"gem 'odin'\" >> Gemfile"
run "rake db:create:all"
run "rake db:migrate"
run "rake odin:awaken"
