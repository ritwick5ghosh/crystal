require "kemal"
require "json"

get "/" do
  "Hello World"
end

post "/note" do |env|
  content = env.params.json
  puts "content #{content.to_s}"
  "good"
end

Kemal.run
