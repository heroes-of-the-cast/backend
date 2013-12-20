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

			# Checks if a charname exists for a given User
			#
			# @param [User] user the user we want to check for
			# @param [String] charname the character name we want to check for
			# @return [Bool] whether or not it exists
			def exists?(user, charname)
				#TODO: Figure out why querying for user fails
				not Character.first(:user_id => user._id, :name => charname).nil?
			end

			# Checks if a character name is a reserved word
			#
			# @param [String] charname the charname to check for
			# @return [Bool] if the charname is a registered keyword
			def reserved? charname
				['create', 'list'].include? charname
			end

			# Creates a new character
			#
			# @param [String] name name of the character
			# @param [String] race race alias of the character
			# @param [String] cclass class alias of the character
			# @param [String] session_key valid Session key
			# @return [Character] the newly created character
			def create(name, race, cclass, session_key)

				user = API::UserMethods::Helpers::Auth::get_logged_in_user(session_key)
				return APIError.new(13, []) if user.nil?
				return APIError.new(11, [name]) if reserved? name
				return APIError.new(2, [user.username, name]) if exists?(user, name)

				r = Races.get(race)
				c = CharClasses.get(cclass)

				stats = CharStats.create(
						:strength => 1,
						:speed => 1,
						:serenity => 1,
						:stamina => 1,
						:sorcery => 1
				)

				char = Character.create(
						:name => name,
						:user => user,
						:race => r,
						:cclass => c,
						:stats => stats
				)

				stats.character = char
				stats.save

				return char

			end
		end
	end
end