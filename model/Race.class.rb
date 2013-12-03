# Character Race
#
# @author Tim van Dalen
class Race < StatModifyingProperty
end

# Collection of defined [Race]s
module Races
	# A totally neutral race that does nothing
	def self.Neutral
		ret = Race.first(:name => "Neutral")
		if ret.nil?
			ret = Race.create(
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
