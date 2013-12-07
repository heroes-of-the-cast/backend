require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'Race.class.rb'

# Gets all races
#
# @return [Array<Race>] all known races
def getlist
	Races.list.to_json
end
