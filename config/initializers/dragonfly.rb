require "dragonfly"

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "2ad5c32f3501216a2d893671bb9fb91d35958fbfa85650f88de64e3ecad352db"

  url_format "/media/:job/:name"

  datastore :file,
            root_path: Rails.root.join("public/system/dragonfly", Rails.env),
            server_root: Rails.root.join("public")
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
