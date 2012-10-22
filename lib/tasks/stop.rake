desc 'stop rails'
task :stop do
  Process.exec('kill -9 $(lsof -i:3000 -t)')
  puts "Shutting down WEBrick\n"

end
