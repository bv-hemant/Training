class Node
	attr_accessor :left,:right,:data

	def initialize(data)
	   @left = nil
	   @right = nil
	   @data = data
	end
end

class Bst

attr_accessor :numbers,:root_node
	
	def create_bst(input)
		
		position=0
		@root_node=nil	
		while position<input.size

			@root_node = insert_Node(@root_node,input[position])
			position=position+1

		end
	end
	
	def insert_Node(root_node,value)

		if root_node== nil
			return Node.new(value);
		elsif 	value>root_node.data
			root_node.right=insert_Node(root_node.right,value)
		else
			root_node.left=insert_Node(root_node.left,value)
		
		end
		return root_node
	end

	def largest_element(root_node)

		if root_node == nil
			return
		elsif root_node.right == nil
			return root_node
		else	
			largest_element(root_node.right)
		end
	end

	def smallest_element(root_node)

		if root_node == nil
			return
		elsif root_node.left == nil
			return root_node
		else	
			smallest_element(root_node.left)
		end
	end
	
	def inorder (root_node,arr)
		
		if root_node == nil
			return
		end

		inorder(root_node.left,arr)
		arr.push( root_node.data)
		inorder(root_node.right,arr)
	end

	def postorder (root_node)
		
		if root_node == nil
			return
		end

		postorder(root_node.left)
		postorder(root_node.right)
		puts root_node.data
	end

	def preorder (root_node)
		
		if root_node == nil
			return
		end

		puts root_node.data
		preorder(root_node.left)
		preorder(root_node.right)
	end
	
	def search_element(root_node,value)
		
		if (root_node == nil || root_node.data == value) 
			return root_node
		elsif value > root_node.data
			return search_element(root_node.right,value)
		else 
			return search_element(root_node.left,value)
		end
		
	end

	def delete_node(root_node,value)
		
		if(root_node == nil)
		  return root_node	
		elsif value>root_node.data
			root_node.right=delete_node(root_node.right,value)
		elsif value<root_node.data
			root_node.left=delete_node(root_node.left,value)
		else 
		
		  if(root_node.left == nil and root_node.right==nil)
		    return nil
		  elsif (root_node.left == nil)
		    return root_node.right
		  elsif (root_node.right == nil)
		    return root_node.left
		  else
		  	temp=smallest_element(root_node.right)
		  	root_node.data=temp.data
		  	root_node.right=delete_node(root_node.right,temp.data)
		  end
		
		end
		
		return root_node
	end

	def root_to_leaf_path(root_node, arr )
		if(root_node==nil)
			return
		end
		
		arr.push(root_node.data)

		if(root_node.left==nil && root_node.right==nil)
			puts "path"
			puts arr

		end
		root_to_leaf_path(root_node.left,arr)	
		root_to_leaf_path(root_node.right,arr)
		
		arr.pop()
	end
end

#main
tree=Bst.new

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

#numbers=[50,30,20,40,70,60,80]
	#numbers=[1,2,3,4,5]

while (1)
puts "Enter your Choice"

	task=gets
	
	case task.to_i
	when 0   #quit 
		File.open('Output', 'w') do |f|   
    	f.puts tree.numbers  
    	end
		break
	when 1 	#Insert
	  	
	  	inputnos=gets	
		tree.numbers=inputnos.split(",").map(&:to_i)
		
		tree.create_bst(tree.numbers)
		
	when 2	#largest element
		node=tree.largest_element(tree.root_node)
		if(node != nil)
			puts  "Largest element :" ,node.data
		end
	when 3 #smalleste element
		node=tree.smallest_element(tree.root_node)
		if(node != nil)
			puts "smallest element :" , node.data
		end
	when 4	#inorder traversal
		puts "Inorder traversal"
		arr=Array.new
		tree.inorder(tree.root_node,arr)
		puts arr
	when 5	#postorder traversal
		puts "Postorder traversal"
		tree.postorder(tree.root_node)
	when 6  #preorder traversal
		puts "Preorder traversal"
		tree.preorder(tree.root_node)
	when 7  # search 
		puts "enter no. to search"
		value=gets
		puts tree.search_element(tree.root_node,value.to_i)
	when 8 #delete
		puts "enter no. to delete"
		value=gets
		tree.root_node= tree.delete_node(tree.root_node,value.to_i)
	when 9 #path from root to leaf  
		tree.root_to_leaf_path(tree.root_node,Array.new)
	when 10 # read from file
		file =File.open("input.txt","r")
	 	file_data=file.read
		tree.numbers=file_data.split("\n").map(&:to_i)
	 	tree.create_bst(tree.numbers)
    
	else 
		"Please Choose the Correct Option"
	end

end