require "http/client"

#input arg 1 directory name
dir_name=ARGV[0]
dir_name_done=dir_name+"/done"
dir_name_fail=dir_name+"/fail"

headers = HTTP::Headers.new

headers["Accept-Encoding"]= "application/json"
headers["Content-Type"]= "application/json"
headers["WM_CONSUMER.ID"]= "e0bc5c16-22b6-41fb-91cf-da9a5e8a928b"
headers["WM_QOS.CORRELATION_ID"]="75E0FDF-4C-C304B10A699AD9"
headers["WM_SVC.ENV"]="prod"
headers["WM_SVC.NAME"]="CustomerAccountService"
headers["WM_SVC.VERSION"]="0.5.30"

puts "reading #{dir_name} , and errors go to #{dir_name_fail}"

#--mkdir for successes and fails
Dir.mkdir(dir_name_done) unless File.exists?(dir_name_done)
Dir.mkdir(dir_name_fail) unless File.exists?(dir_name_fail)

#create the channel that will receive the response from the post call
channel = Channel(HTTP::Client::Response).new

#spawn Fibers here and collect the response using Channels.
d = Dir.new(dir_name)
d.each do |next_file|
  if File.extname(next_file) == ".txt"
    next_file = "./"+dir_name.to_s+"/"+next_file
    json_payload =   File.read(next_file, "UTF-8", invalid: :replace)
    work_file_name = next_file.to_s+".inprocess"
    File.rename(next_file, work_file_name)
    puts "processing #{next_file} "

    spawn do
      begin
        #Creating the HTTP client
        #response = HTTP::Client.post("http://0.0.0.0:3000/note", headers: headers, body: json_payload)
        response = HTTP::Client.post("http://ca.prod.walmart.com/ca-app/services/customernotes/notes/batch", headers: headers, body: json_payload)
        channel.send response
      rescue ex
         channel.send HTTP::Client::Response.new(500, body=ex.message)
      end
    end

    #collect the response from the channel and continue
    response = channel.receive
    response_code = response.status_code
    response_body = response.body

    if (response_code.to_i == 200)
      puts "got good response #{response_code}"
      # good responses get moved
      ok_file_name = next_file.to_s+".#{response_code}"
      File.rename(work_file_name, ok_file_name )
      `mv #{ok_file_name} #{dir_name_done}`
    else
      puts "got bad response code #{response_code}"
      # bad get moved to fail
      bad_file_name = next_file.to_s+".#{response_code}"
      File.rename(work_file_name, bad_file_name )
      `mv #{bad_file_name} #{dir_name_fail}`

      body_file_name = next_file.to_s+".fail.body"
      new_file = File.new(body_file_name, "w+")
      new_file.puts response_body
      `mv #{new_file} #{dir_name_fail}`
    end
  end
end

Fiber.yield