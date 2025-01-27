This gem adds a specific middleware to get the username and the activity in a log located in tmp.


# Development

Go to gitlab initializers repository

```
cd /opt/gitlab/embedded/service/gitlab-rails/config/initializers
```

Add file : opdo_epfl_spymiddleware.rb in the initializers repository

Restart gitlab : 

```
gitlab-ctl restart 
```

A log file will be created in ```/tmp/opdo_epfl_spymiddleware.log```


# Add gem

In you gemFile, add a line :

```
# OPDo for EPFL logs
gem 'opdo_epfl_spymiddleeware', '1.0.0'
```

# Add logrotate

Too complete the installation :

```
cd /etc/logrotate.d
nano gitlab 
```

insert :

```
	/tmp/opdo_epfl_spymiddleware.log {
		daily
		missingok
		dateext
		rotate 52
		compress
		delaycompress
		notifempty
		copytruncate
	}
```

