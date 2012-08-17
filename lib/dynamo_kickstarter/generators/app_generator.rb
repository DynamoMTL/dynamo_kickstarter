require 'rails/generators'

module DynamoKickstarter
  class AppGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def readme
      remove_file 'README.rdoc'
      template 'README.md.erb', 'README.md'
    end

    def remove_public_index
      remove_file 'public/index.html'
    end

    def remove_rails_logo_image
      remove_file 'app/assets/images/rails.png'
    end

    def setup_staging_environment
      run 'cp config/environments/production.rb config/environments/staging.rb'
    end
  end
end
