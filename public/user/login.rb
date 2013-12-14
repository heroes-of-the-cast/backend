require 'Password.type.rb'
require 'Character.class.rb'
require 'User.class.rb'
require 'Session.class.rb'
require 'APIError.class.rb'

# All API methods
module API
	# Operations on users
	module UserMethods
		extend self
		
		# Logs a user in
		#
		# @param [String] username the name of the user logging in
		# @param [String] password unhashed password of the user
		# @param [Session] newly created session
		def login(username, password, user_agent, ip)
			user = User.first(:username => username, :password => password)
			
			if not user.nil?
				Session.create(
					:key => Session.generate_key(username),
					:user => user,
					:device => user_agent,
					:ip => ip
				)
			else
				APIError.new(13, [])
			end
		end
	end
end
