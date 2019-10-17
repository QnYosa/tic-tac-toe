class BoardCase
	attr_accessor :position, :value

	def initialize(position)
		@position = position
		@value = nil
	end

	def is_empty?
		@value == nil
	end

end