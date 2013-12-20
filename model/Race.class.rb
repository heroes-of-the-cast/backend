# Character Race
#
# @author Tim van Dalen
class Race < StatModifyingProperty
end

# Collection of defined [Race]s
module Races
	# Returns aliases for all known races
	#
	# @return [Array<String>] aliases of all known races
	def self.all
		["neutral"]
	end
	
	# Returns a list of all known races
	#
	# @return [Array<Race>] all known races
	def self.list
		ret = []
		Races::all.each do |ralias|
			ret << Races::get(ralias)
		end
		ret
	end

	# Makes a new Race
	# This should only be called when a Race doesn't exist yet, no further checks will be done
	#
	# @param [String] race alias of the Race you want to create (which should not yet exist in the database)
	# @return [Race] the race you wanted to create
	def self.make race
		case race
		when "neutral"
			ret = Race.make(race, "Neutral", "Nothing(race type)",CharStats.new(:strength => 1,:speed => 1,:serenity => 1,:stamina => 1,:sorcery => 1))
		end
		
		ret
	end

	# @return [Race] A totally neutral race that does nothing
	def self.Neutral
		Races::get "neutral"
	end
	
	# Gets a race
	#
	# @param [String] race alias of the Race you want to get
	# @return [Race] the requested race
	def self.get race
		ret = Race.first(:alias => race)
		if ret.nil?
			ret = Races::make race
		end
		ret
	end
end
