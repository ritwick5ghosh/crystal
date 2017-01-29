basePath = "/Users/rghosh/notespump/queue/"
failPath = "/Users/rghosh/notespump/queue/fail/"
failDir = Dir.new(failPath)

failDir.each do |next_file|
  next unless File.extname(next_file) == ".500"
  file_path = failPath + next_file
  new_file_path = basePath + next_file.gsub(".500", "")
  `mv #{file_path} #{new_file_path}`
end
