require 'rails/generators'

module DynamoKickstarter
  class AppGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def readme
      remove_file 'README.rdoc'
      template 'README.md.erb', 'README.md'
    end
  end
end
