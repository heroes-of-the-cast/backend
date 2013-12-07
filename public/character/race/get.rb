require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'Race.class.rb'

# Gets a race by alias
#
# @param [String] _alias
# @return [Race] the requested race
def getrace _alias
	(Races.get _alias).to_json
end
