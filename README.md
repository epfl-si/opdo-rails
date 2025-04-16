This gem adds a specific middleware to get the username and the activity in a log located in tmp.


# Add gem

Go to the gems repository, p.e. for gitlab :

```
cd /opt/gitlab/embedded/service/gitlab-rails/gems
```

Clone the opdo-rails repository :

```
git clone https://github.com/epfl-si/opdo-rails.git
```

In the Gemfile, add the reference to the cloned gem :

```
# OPDo for EPFL logs
gem 'opdo_epfl_spymiddleware', "~> 1.0.0", path: 'gems/opdo-rails'
```

Restart the application, p.e. for gitlab : 

```
gitlab-ctl restart 
```

A log file will be created in ```/tmp/opdo_epfl_spymiddleware.csv```
