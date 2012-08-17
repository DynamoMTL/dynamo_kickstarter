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

    def use_postgres_config_template
      template 'postgresql_database.yml.erb', 'config/database.yml.example',
        :force => true
    end

    def configure_heroku
      template 'heroku.yml.erb', 'config/heroku.yml'
    end
  end
end
