# A playable character
#
# @author Tim van Dalen
class Character
	include MongoMapper::Document
	
	# @return [User] the user that made this character
	belongs_to :user
	
	# @return [Race] the race this char is of
	one :race
	
	# @return [CharClass] the character's class
	one :class
end
