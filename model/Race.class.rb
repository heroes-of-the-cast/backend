# Character Race
#
# @author Tim van Dalen
class Race < StatModifyingProperty
end

# Collection of defined [Race]s
module Races
	# @returns [Race] A totally neutral race that does nothing
	def self.Neutral
		Races::get "neutral"
	end
	
	# Gets a race
	#
	# @param [String] race alias of the Race you want to get
	# @returns [Race] the requested race
	def self.get race
		ret = Race.first(:alias => race)
		if ret.nil?
			ret = make race
		end
		ret
	end
	
	# Makes a new Race
	# This should only be called when a Race doesn't exist yet, no further checks will be done
	#
	# @param [String] race alias of the Race you want to create (which should not yet exist in the database)
	# @param [Race] the race you wanted to create
	def make race
		case race
		when "neutral"
			ret = Race.create(
				:alias => "neutral",
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
	
	private :make
end
