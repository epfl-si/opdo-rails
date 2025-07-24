OPDo for Rails
==============

[![ImageRuby](https://img.shields.io/badge/ruby-3.0.0-green)]()

This gem adds a spy middleware that logs the username and activity to a file in /tmp.

# Prerequisites

- ruby version >= 3.0.0

# Development

1. add the gem in your Gemfile
```
gem "opdo_epfl_spymiddleware", git: 'https://github.com/epfl-si/opdo-rails.git'
```
2. run bundle
```
bundle install
```
3. add the middleware in your configuration file, ```config/application.rb``` (at the end of the file or inside the section Application < Rails::Application)
```
config.middleware.use OPDO_EPFL_Middleware::Middleware
```
4. restart the application
   i.e. if you works in GDK:
```
gdk restart
```

A log file will be created at /tmp/opdo_epfl_spymiddleware.log, in which every action will be recorded.
