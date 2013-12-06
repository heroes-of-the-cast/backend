# Abstract property that can modify stats
#
# @author Tim van Dalen
class StatModifyingProperty
	include MongoMapper::Document
	
	# @returns [String] a unique, simple, alias for usage in the API
	key :alias, String
	
	key :name, String
	
	key :description, String
	
	# @return [Stats] the actual modifiers. 1 is no modification, <1 is down scaling, >1 is up scaling
	key :modifiers, Stats
	
	# Makes a new StatModifyingProperty
	#
	# @param [String] alias the alias for this new property
	# @param [String] name friendly name
	# @param [String] description back-story
	# @param [Stats] stats the actual modifiers. 1 is no modification, <1 is down scaling, >1 is up scaling
	# @return [self] the newly created property, of the type of the class this was called on
	def self.make(p_alias, name, description, stats)
		self.create(
			:alias => p_alias,
			:name => name,
			:description => description,
			:modifiers => stats
		)
	end
end

StatModifyingProperty.ensure_index [[:alias, 1]]
