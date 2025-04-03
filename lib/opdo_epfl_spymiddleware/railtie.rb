require "opdo_epfl_spymiddleware/middleware"

module OPDO_EPFL_Middleware

	class OPDO_EPFL_SpyMiddleware < Rails::Railtie
		initializer "opdo_epfl_spymiddleware.configure_rails_initialization" do |app|
			app.middleware.use OPDO_EPFL_Middleware::Middleware
		end
	end

end
