require "http/client"
#puts ARGV

#puts ARGV.class

#puts ARGV.join(' ')

#ARGV.each do |item|
#  puts item
#end

#d = Dir.new(".")
#d.each { |x| puts x.class; "Got #{x}" unless File.extname(x) != ".yml" }

#client = HTTP::Client.new "www.example.com"

channel = Channel(Nil).new
5.times do
  spawn call channel
end

5.times { channel.receive }

def call(channel)
  begin
    response = HTTP::Client.get "http://www.example.com"
    puts response.body.lines.first
  rescue ex
    puts ex.message
  ensure
    channel.send nil
  end
end
