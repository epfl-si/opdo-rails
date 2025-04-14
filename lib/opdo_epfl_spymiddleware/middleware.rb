# frozen_string_literal: true

module OPDO_EPFL_Middleware

	class Middleware
		PATHSKIP_RE = %r{/(rails/|assets|path_to_skip)}

		def initialize(app)
			@app = app
		end

		def call(env)
			status, headers, response = @app.call(env)
			spy(env)
			[status, headers, response]
		end

		def spy(env)
			req = Rack::Request.new env
			return if req.path =~ PATHSKIP_RE
			us = user(req)
			return if us === "NO AUTH"
			route = Rails.application.routes.recognize_path(req.path)
			report = [
				"#{Time.now.iso8601(3)}",
				"#{user(req)}",
				"#{req.params}",
				"#{req.path}",
				"#{req.ip}",
				"#{route}"
			]
			OPDO_EPFL_LOGGER.info("#{report.to_csv(:col_sep => ";", :quote_char => '"')}")
		end

		def user(req)
			u = req.env['warden']&.user(:user)
			if u.nil? && defined?(Current) && Current.respond_to?(:user)
				u = Current.user
			end
			u.nil? ? "NO AUTH" : u.username   # u.email, u.name
		end
	end

end
