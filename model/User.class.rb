# A user of the game
#
# Can have multiple devices
#
# @author Tim van Dalen
class User
	include MongoMapper::Document
	
	# @return [String] picked name of the user
	key :username, String
	# @return [String] the users password, hashed
	key :password, Password
	# @return [Array<Character>] list of the user's created characters
	many :characters
end

User.ensure_index [[:username, 1]], :unique => true
