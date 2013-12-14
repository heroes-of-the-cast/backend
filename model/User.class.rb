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
	
	# Hash representation of this user
	#
	# @return [Hash] representation of this user, to be JSONified
	def as_json(options={})
		super({ :only => [:username, :characters] })
	end
end

User.ensure_index [[:username, 1]], :unique => true
