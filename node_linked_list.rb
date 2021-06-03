load "node_value.rb"

class NodeLinkedList < NodeValue
	attr_accessor :next

	def initialize(data)
	   @next = nil
	   @data = data
	end
end