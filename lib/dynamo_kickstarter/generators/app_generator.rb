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

    def add_brew_file
      template 'Brewfile.erb', 'Brewfile'
    end

    def configure_foreman
      template 'forem.erb', '.foreman'
    end

    def add_rvmrc
      template 'rvmrc.erb', '.rvmrc'
    end

    def add_gems
      gem 'brewdler', :group => :development
      gem 'foreman', :group => :development
      gem 'heroku_san', :group => :development
      gem 'thin'
      bundle_command :install
    end

    def configure_heroku
      template 'heroku.yml.erb', 'config/heroku.yml'
    end

    def add_foreman
      copy_file 'Procfile'
    end

    def add_env
      copy_file 'env.erb', '.env'
    end

    def add_install_script
      template 'install.erb', 'script/install'
      run 'chmod +x script/install'
    end

    def commit
      git :add => '-A'
      git :commit => '-m "Configured application automatically with Dynamo Kickstarter"'
    end

    def finish
      say <<-MSG

===============================================================================
Your application has been configured and an install script has been
generated and placed in script/install. It assumes that the repository
name for the application is #{application_name}.

Next steps:

1. Review the heroku setup in config/heroku.yaml and run:

   rake staging production heroku:create heroku:addons

2. Create a repository on Github with the name '#{application_name}'.

3. Push the application to Github.

4. Deploy your application to Heroku:

   rake staging production heroku:deploy

4. Run the install script to complete the process. This also ensures the install
   script will work for other developers:

   cd .. & script/install
===============================================================================

      MSG
    end

    private

    def bundle_command(command)
      say_status :run, "bundle #{command}"
      print `"#{Gem.ruby}" -rubygems "#{Gem.bin_path('bundler', 'bundle')}" #{command}`
    end
  end
end
