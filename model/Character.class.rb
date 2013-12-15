# A playable character
#
# @author Tim van Dalen
class Character
	include MongoMapper::Document

	# @return [String] name of the character
	key :name, String, :minimum => 1

	# @return [User] the user that made this character
	belongs_to :user
	
	# @return [Race] the race this char is of
	one :race
	
	# @return [CharClass] the character's class
	one :cclass, :class_name => 'CharClass'

	#one :stats

	# Generates stats for the user
	#before_create do
	#	# TODO: some randomness
	#	stats = Stats.new(
	#			:strength => 1,
	#			:speed => 1,
	#			:serenity => 1,
	#			:stamina => 1,
	#			:sorcery => 1
	#	)
	#end

	# Hash representation of this character
	#
	# @return [Hash] representation of this session, to be JSONified
	def as_json(options={})
		{
				'name' => name,
				'user' => user.username,
				'race' => race.alias,
				'cclass' => cclass.alias
		}
	end
end

Character.ensure_index([[:user, 1], [:name, 1]], :unique => true)
