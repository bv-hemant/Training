load "bst.rb"

tree = Bst.new

puts "0 : Quit"
puts "1 : Insert no"
puts "2 : Largest element"
puts "3 : Smallest element"
puts "4 : Inorder traversal"
puts "5 : Postorder traversal"
puts "6 : Preorder traversal"
puts "7 : Search element"
puts "8 : Delete Element"
puts "9 : All Path from Root to leaf"
puts "10: Input from file"

different_task = 
	{quit: 0,
	insert_no: 1,
	largest_element: 2,
	smallest_element: 3,
  inorder_traversal: 4,
  postorder_traversal: 5,
  preorder_traversal: 6,
  search_element: 7,
  delete_node: 8,
  all_path_root_leaf: 9,
  input_file: 10 }

loop do

	puts "Enter your Choice"
	task = gets
	
	case task.to_i
	when different_task.fetch(:quit)   #quit 
		File.open('Output', 'w') do |f|   
    			f.puts tree.numbers  
    		end
		break

	when different_task.fetch(:insert_no) 	#Insert
	  input = gets	
		tree.numbers = input.split(",").map(&:to_i)
		tree.create_bst(tree.numbers)

	when different_task.fetch(:largest_element)	#largest element
		node = tree.largest_element(tree.root_node)
		if(node != nil)
			node.data
		end

	when different_task.fetch(:smallest_element) #smalleste element
		node = tree.smallest_element(tree.root_node)
		if(node != nil)
			node.data
		end

	when different_task.fetch(:inorder_traversal)	#inorder traversal
		puts "Inorder traversal"
		inorder_arr = Array.new
		tree.inorder(tree.root_node,inorder_arr)
		puts inorder_arr

	when different_task.fetch(:postorder_traversal)	#postorder traversal
		puts "Postorder traversal"
		tree.postorder(tree.root_node)

	when different_task.fetch(:preorder_traversal)  #preorder traversal
		puts "Pretorder traversal"
		tree.preorder(tree.root_node)

	when different_task.fetch(:search_element) # search 
		puts "enter no. to search"
		value = gets
		puts tree.search_element(tree.root_node,value.to_i)

	when different_task.fetch(:delete_node) #delete
		puts "enter no. to delete"
		value = gets
		tree.root_node = tree.delete_node(tree.root_node,value.to_i)

	when different_task.fetch(:all_path_root_leaf)#path from root to leaf  
		tree.root_to_leaf_path(tree.root_node,Array.new)

	when different_task.fetch(:input_file) # read from file
		file = File.open("input.txt","r") 
	 	file_data = file.read
	 	tree.numbers = []
	 	tree.numbers = file_data.split("\n").map(&:to_i)
	 	tree.create_bst(tree.numbers)

  else puts "Please Choose the Correct Option"
	end
end
