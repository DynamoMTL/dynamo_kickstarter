# Dynamo Kickstarter

Configures a Ruby on Rails environment based on Dynamo's development and
deployment preferences (Heroku). In summary it:

1. Optimize for use with Heroku

  * Use S3 for asset storage
  * Store senstive information in environment variables, never in source code
  * Replicate key components of the production environment
  * Including PostegreSQL, Thin, Foreman

2. Setup standard production and staging enviroments

  * Setup Heroku with required add-ons such as pg:backups
  * Setup buckets on S3

3. Setup deployment configuration (using Heroku San)

2. Uses the installer to complete the local setup of the application

  * The same installer that a developer uses to setup an existing application
    is run to ensure it will work for them

This generator can be used with an greenfield application or a new instance of
a platform such as Spree or Refinery.

## Installation

Add this line to your application's Gemfile:

    gem 'dynamo_kickstarter'

And then execute:

    $ bundle

## Usage

To setup your application run:

    rails generate dynamo_kickstarter:app start
    rake dynamo:install

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
