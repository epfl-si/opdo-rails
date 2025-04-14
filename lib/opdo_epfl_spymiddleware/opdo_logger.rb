module OPDO_EPFL_Middleware

    class OpdoEpflLogger < Logger
        def format_message(severity, timestamp, progname, msg)
          "#{msg}"
        end
    end
        
    logfile = File.open('/tmp/opdo_epfl_spymiddleware.csv', 'a')
    logfile.sync = true  # automatically flushes data to file
    OPDO_EPFL_LOGGER = OpdoEpflLogger.new(logfile)

end
