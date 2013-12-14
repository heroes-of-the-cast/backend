require 'Password.type.rb'
require 'Character.class.rb'
require 'User.class.rb'
require 'APIError.class.rb'

# All API methods
module API
	# Operations on users
	module UserMethods
		extend self
		
		# Gets a user
		#
		# @param [String] username the name of the user
		# @param [User] the requested user
		def get username
			user = User.first(:username => username)
			
			if not user.nil?
				user
			else
				APIError.new(12, [username])
			end
		end
	end
end
