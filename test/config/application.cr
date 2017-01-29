require "../app/views/application_view"
require "../app/views/layouts_view"

require "../app/controllers/application_controller"
require "../app/controllers/**"
require "../app/models/**"

module Test
  {{ run "./routes.cr", "--codegen" }}
end

abstract class Frost::Controller
  include Test::NamedRoutes
end
