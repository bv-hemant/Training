load "node_tree.rb"
load "string.rb"
class Bst < String 
	attr_accessor :numbers, :root_node
	
	def create_bst(input)
		@root_node = nil
		input.each do |n|
			@root_node = insert_Node(@root_node,n)	
		end
	end
	
	def insert_Node(root_node,value)
		if root_node.nil?
			return NodeTree.new(value);
		elsif value > root_node.data
			root_node.right = insert_Node(root_node.right,value)
		else
			root_node.left = insert_Node(root_node.left,value)
		end
		root_node
	end

	def largest_element(root_node)
		if root_node.nil?
			return
		elsif root_node.right.nil?
			return root_node
		else	
			largest_element(root_node.right)
		end
	end

	def smallest_element(root_node)
		if root_node.nil?
			return
		elsif root_node.left.nil?
			return root_node
		else	
			smallest_element(root_node.left)
		end
	end
	
	def inorder (root_node,arr)
		if root_node.nil?
			return
		end
		inorder(root_node.left,arr)
		arr.push( root_node.data)
		inorder(root_node.right,arr)
	end

	def postorder (root_node)
		if root_node.nil?
			return
		end
		postorder(root_node.left)
		postorder(root_node.right)
		puts root_node.data
	end

	def preorder (root_node)
		if root_node.nil?
			return
		end
		puts root_node.data
		preorder(root_node.left)
		preorder(root_node.right)
	end
	
	def search_element(root_node,value)
		if (root_node.nil? || root_node.data == value) 
			return root_node
		elsif value > root_node.data
			return search_element(root_node.right,value)
		else 
			return search_element(root_node.left,value)
		end
	end

	def delete_node(root_node,value)
		if root_node.nil?
			return root_node	
		elsif value > root_node.data
			root_node.right = delete_node(root_node.right,value)
		elsif value < root_node.data
			root_node.left = delete_node(root_node.left,value)
		else 
			if (root_node.left.nil? && root_node.right.nil?)
				return nil
			elsif root_node.left.nil?
				return root_node.right
			elsif root_node.right.nil?
				return root_node.left
			else
				temp = smallest_element(root_node.right)
				root_node.data = temp.data
				root_node.right = delete_node(root_node.right,temp.data)
			end
		end
		root_node
	end

	def print_all_path(root_node, arr )
		if root_node.nil?
			return
		end
		
		arr.push(root_node.data)

		if(root_node.left.nil? && root_node.right.nil?)
			puts "path" , arr
		end
		
		print_all_path(root_node.left,arr)	
		print_all_path(root_node.right,arr)
		arr.pop()
	end

	def perform_task
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
				print_all_path: 9,
				input_file: 10 }

		loop do

			print "\nEnter your Choice : "
			task = gets
			if(task.integer?)
				case task.to_i
				when different_task[:quit]   #quit 
					File.open('Output', 'w') do |f|   
						f.puts @numbers  
					end
					break

				when different_task[:insert_n] 	#Insert
					input = gets	
					@numbers = input.split(",")
					@numbers = integer_array(input_arr)
					if @numbers.size > 0
						create_bst(@numbers)
					end

				when different_task[:largest_element]	#largest element
					node = largest_element(@root_node)
					if(node != nil)
						puts node.data
					else 
						puts "tree is empty"
					end

				when different_task[:smallest_element] #smalleste element
					node = smallest_element(@root_node)
					if(node != nil)
						puts node.data
					else 
						puts "tree is empty"
					end

				when different_task[:inorder_traversal]	#inorder traversal
					puts "Inorder traversal"
					inorder_arr = Array.new
					inorder(@root_node,inorder_arr)
					puts inorder_arr

				when different_task[:postorder_traversal]	#postorder traversal
					puts "Postorder traversal"
					postorder(@root_node)

				when different_task[:preorder_traversal]  #preorder traversal
					puts "Pretorder traversal"
					preorder(@root_node)

				when different_task[:search_element] # search 
					puts "enter no. to search"
					value = gets
					puts search_element(@root_node,value.to_i)

				when different_task[:delete_node] #delete
					puts "enter no. to delete"
					value = gets
					@root_node = delete_node(@root_node,value.to_i)

				when different_task[:print_all_path] #path from root to leaf  
					print_all_path(@root_node,Array.new)

				when different_task[:input_file] # read from file
					file = File.open("input.txt","r") 
					file_data = file.read
					@numbers = []
					input_arr = file_data.split("\n")
					@numbers = integer_array(input_arr)

					if @numbers.size > 0
						create_bst(@numbers)
					end

				else puts "Please Choose the Correct Option"
				end
			else
				puts "Please Choose the Correct Option"
			end
		end
	end
end

