require "frost/server"
require "./config/bootstrap"

module Test
  class Server < Frost::Server
    #def handlers
    #  [
    #    Frost::Server::LogHandler.new,
    #    Frost::Server::HttpsEverywhereHandler.new(308),
    #    Frost::Server::PublicFileHandler.new(File.join(Frost.root, "public"))
    #  ]
    #end

    def dispatcher
      @dispatcher ||= Test::Dispatcher.new
    end
  end

  Server.run
end
