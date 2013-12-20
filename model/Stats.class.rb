# Stats for a character
#
# These are pretty subjected to change right now, since I haven't figured out much of the actual game yet
#
# @author Tim van Dalen
class CharStats
	include MongoMapper::Document
	
	# @return [Integer] character strength
	key :strength, Integer
	# @return [Integer] character speed
	key :speed, Integer
	# @return [Integer] character serenity
	key :serenity, Integer
	# @return [Integer] character stamina
	key :stamina, Integer
	# @return [Integer] character sorcery
	key :sorcery, Integer

	belongs_to :character

	# Hash representation of these stats
	#
	# @return [Hash] representation of these stats, to be JSONified
	def as_json(options={})
		{
				'strength' => strength,
				'speed' => speed,
				'serenity' => serenity,
				'stamina' => stamina,
				'sorcery' => sorcery
		}
	end
end
