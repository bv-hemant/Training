load "bst.rb"
load "linked_list.rb"

different_data_structure = {bst: 0, linked_list: 1}

puts	"#{different_data_structure.fetch(:bst)}: Binary search tree" ,
			"#{different_data_structure.fetch(:linked_list)}: Linked List  "

print "enter your choice : "
type_of_ds = gets

case type_of_ds.to_i
when different_data_structure.fetch(:bst)
	tree = Bst.new
	tree.perform_task

when different_data_structure.fetch(:linked_list)
	linked_list = Linked_list.new
	linked_list.perform_task
	
else puts "wrong choice"	
end


