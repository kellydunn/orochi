run "echo \"gem 'orochi'\" >> Gemfile"
run "rake db:create:all >> /dev/null"
run "rake db:migrate >> /dev/null"
run "rake orochi:awaken >> /dev/null"
