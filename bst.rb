load "node.rb"

class Bst
	attr_accessor :numbers, :root_node
	
	def create_bst(input)
		@root_node = nil
		input.each do |n|
			@root_node = insert_Node(@root_node,n)	
		end
	end
	
	def insert_Node(root_node,value)
		if root_node.nil?
			return Node.new(value);
		elsif value > root_node.data
			root_node.right = insert_Node(root_node.right,value)
		else
			root_node.left = insert_Node(root_node.left,value)
		end
		return root_node
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
		return root_node
	end

	def root_to_leaf_path(root_node, arr )
		if root_node.nil?
			return
		end
		
		arr.push(root_node.data)

		if(root_node.left.nil? && root_node.right.nil?)
			puts "path" , arr
		end
		
		root_to_leaf_path(root_node.left,arr)	
		root_to_leaf_path(root_node.right,arr)
		arr.pop()
	end
end

