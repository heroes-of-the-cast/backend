# Character Class
#
# @author Tim van Dalen
class CharClass < StatModifyingProperty
end

# Collection of defined [CharClass]s
module Races
	# A totally neutral class that does nothing
	def self.Neutral
		ret = CharClass.first(:name => "Neutral")
		if ret.nil?
			ret = CharClass.create(
				:name => "Neutral",
				:description => "Nothing",
				:modifiers => Stats.create(
					:strength => 1,
					:speed => 1,
					:serenity => 1,
					:stamina => 1,
					:magic => 1
				)
			)
		end
		ret
	end
end
