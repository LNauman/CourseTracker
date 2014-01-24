require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "9b60f46b91bc5b86fd64c7a2f360c0e0ae998bb202ad8c2effb7e9766357b925"


def thumb(size='40x40#')
  original = case doc.ext
  when 'png', 'gif' ,'jpeg', 'jpg'
    doc
  when 'pdf'
    Dragonfly[:images].fetch_file("/images/file_icons/pdf.png")
  end
  original.thumb(size).url
end

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
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
