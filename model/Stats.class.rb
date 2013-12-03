# Stats for a character
#
# These are pretty subjected to change right now, since I haven't figured out much of the actual game yet
#
# @author Tim van Dalen
class BaseStats
	include MongoMapper::EmbeddedDocument
	
	# @return [Integer] character strength
	key :strength, Integer
	# @return [Integer] character speed
	key :speed, Integer
	# @return [Integer] character serenity
	key :serenity, Integer
	# @return [Integer] character stamina
	key :stamina, Integer
	# @return [Integer] character magic (I should really find an S-word for magic EDIT: duh, sorcery)
	key :magic, Integer
end
