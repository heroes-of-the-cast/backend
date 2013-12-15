require 'Session.class.rb'

# All API methods
module API
	# Operations on users
	module UserMethods
		# Helpers for user
		module Helpers
			# Helper auth methods
			module Auth
				extend self

				# Validates a session key
				#
				# @param [String] session_key the session key to look up the user for
				# @return [User] the User that is logged in with this key
				def get_logged_in_user(session_key)
					Session.first(:key => session_key).user
				end
			end
		end
	end
end
