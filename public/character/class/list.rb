require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'CharClass.class.rb'

# Gets all classes
#
# @return [Array<CharClass>] all known classes
def getlist
	CharClasses.list.to_json
end
