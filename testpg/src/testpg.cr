require "pg"
DB = PG.connect("postgres://postgres@localhost:5432/test_development")


result = DB.exec("select version()")
puts result.to_hash
