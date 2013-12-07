require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'Race.class.rb'

# API methods on characters
module Character
	# API methods on character races
	module Race
		extend self
		# Gets all races
		#
		# @return [Array<Race>] all known races
		def getlist
			Races.list.to_json
		end
	end
end
