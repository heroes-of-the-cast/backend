require 'Password.type.rb'
require 'Character.class.rb'
require 'User.class.rb'
require 'APIError.class.rb'

# All API methods
module API
	# Operations on users
	module UserMethods
		extend self
		
		# Checks if a user exists
		#
		# @param [String] username the username to check for
		# @return [Bool] if the user exists
		def exists? username
			not User.first(:username => username).nil?
		end
		
		# Checks if a username is a reserved word
		#
		# @param [String] username the username to check for
		# @return [Bool] if the username is a registered keyword
		def reserved? username
			["create"].include? username
		end
		
		# Creates a new user
		#
		# @param [String] username the name for the new user
		# @param [String] password new password, unhashed
		def create(username, password)
			return APIError.new(11, [username]) if reserved? username
			return APIError.new(1, [username]) if exists? username
			
			User.create(
				:username => username,
				:password => password
			)
		end
	end
end
