require 'Password.type.rb'
require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'Race.class.rb'
require 'CharClass.class.rb'
require 'Character.class.rb'
require 'User.class.rb'
require 'APIError.class.rb'

# All API methods
module API
	# Operations on users
	module UserMethods
		# Operations on users characters
		module CharacterMethods
			extend self

			# Gets all characters for a user
			#
			# @param [String] username the user to get all chars for
			# @return [Array<Character>] all characters for that user
			def list(username)
				Character.all(:user_id => User.first(:username => username)._id)
			end
		end
	end
end
