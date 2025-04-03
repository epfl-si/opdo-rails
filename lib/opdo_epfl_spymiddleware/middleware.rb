# frozen_string_literal: true

module OPDO_EPFL_Middleware

	class Middleware
		PATHSKIP_RE = %r{/(rails/|assets|path_to_skip)}

		def initialize(app)
			@app = app
			@file_logger = Logger.new('/tmp/opdo_epfl_spymiddleware.log')
			@file_logger.info("===> OPDo EPFL Spy is starting")
		end

		def call(env)
			status, headers, response = @app.call(env)
			spy(env)
			[status, headers, response]
		end

		def spy(env)
			req = Rack::Request.new env
			return if req.path =~ PATHSKIP_RE

			route = Rails.application.routes.recognize_path(req.path)
			report = {
				'time' => Time.zone.now.strftime('%Y%m%d-%H%M-%s'),
				'user' => user(req),
				'path' => req.path,
				'params' => req.params,
				'route' => route,
			}
			@file_logger.debug("=== #{report.to_yaml}")
		end

		def user(req)
			u = req.env['warden'].user(:user)
			u.nil? ? "NO AUTH" : u.slice(:name, :email, :username).to_h
		end
	end

end
