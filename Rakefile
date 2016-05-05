task default: %w[server]

task :server do
  sh 'ruby -I . -w src/server.rb'
end
task :doc do
  sh 'rdoc --exclude "public/|views/" src'
end
task :sandbox do
  sh 'ruby src/models/sandbox.rb'
end
task :seed do
  sh 'ruby -I . src/db/seed.rb'
end
