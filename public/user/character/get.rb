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

			# Gets a character
			#
			# @param [String] username the user to which the character belongs
			# @param [String] charname the name of the character
			# @return [Character] the requested character
			def get(username, charname)
				Character.first(:user_id => User.first(:username => username)._id, :name => charname)
			end
		end
	end
end
