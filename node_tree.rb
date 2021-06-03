load "node_value.rb"

class NodeTree < NodeValue
	attr_accessor :left,:right

	def initialize(data)
	   @left = nil
	   @right = nil
	   @data = data
	end
end