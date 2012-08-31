# Dynamo Kickstarter

Any new Ruby on Rails application requires the installation of the Dynamo
Kickstarter gem. Once installed the generator and install tasks are run.

The Dynamo Kickstarter gem configures the application based on Dynamo's
development and deployment preferences. In summary it:

1. Configures for use with Heroku
    * Uses S3 for asset storage
    * Stores senstive information in environment variables, never in source code
    * Replicates key components of the production environment such as PostegreSQL, Thin, Foreman
2. Configures standard production and staging enviroments
    * Configures Heroku with required add-ons such as pg:backups
    * Creates buckets on S3
3. Sets-up deployment configuration (using Heroku San)
4. Uses the installer to complete the local setup of the application
    * The same installer that a developer uses to setup an existing application
      is run to ensure it will work for others in the future

This generator can be used with an greenfield application or a new instance of
a platform such as Spree or Refinery.

## Installation

Generate your Rails application as you usual. For a greenfield application run:

    rails new my_application

And then add this line to your application's Gemfile:

    gem 'dynamo_kickstarter', git: 'git://github.com/DynamoMTL/dynamo_kickstarter.git'

And then execute:

    $ bundle

## Usage

To configure the application run:

    rails generate dynamo_kickstarter:app start
    rake dynamo:install

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## References

* http://rdoc.info/github/wycats/thor/master/Thor/Actions.html
