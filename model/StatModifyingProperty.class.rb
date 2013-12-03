# Abstract property that can modify stats
#
# @author Tim van Dalen
class StatModifyingProperty
	include MongoMapper::Document
	
	key :name, String
	
	key :description, String
	
	# @return [Stats] the actual modifiers. 1 is no modification, <1 is down scaling, >1 is up scaling
	key :modifiers, Stats
end

StatModifyingProperty.ensure_index [[:name, 1]]
