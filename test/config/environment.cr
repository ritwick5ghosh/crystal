module Frost
  # :nodoc:
  VIEWS_PATH = "#{ __DIR__ }/../app/views"

  self.root = File.expand_path("../..", PROGRAM_NAME)
  self.environment = ENV.fetch("FROST_ENV", "development")

  module Config
    case Frost.environment
    when "development", "test"
      self.secret_key = ENV.fetch("SECRET_KEY", "1b2fe62fdc5694ce1523afcc3c463af8c4b75d45891409b1d004eb1bf8fd66c8")
    else
      self.secret_key = ENV["SECRET_KEY"]
    end
  end
end
