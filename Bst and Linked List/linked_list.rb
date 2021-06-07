load "node_linked_list.rb"

class Linkedlist 
	attr_accessor :head_node

	def check_input_array(arr)
		arr.each { |e|
		return false if e.to_s !~ /^\d+$/
		}
		true
	end

	def search_element(value)
		result = false
		current_node = @head_node

		while current_node != nil
			if(current_node.data == value)
				result = true
				break
			end
			current_node = current_node.next
		end
		return result
	end

	def delete_node(value)
		current_node = @head_node

		if(current_node != nil && current_node.data == value)
			@head_node = current_node.next
			
		else
			prev = nil
			while (current_node != nil && current_node.data != value)
				prev = current_node
				current_node = current_node.next
			end

			if current_node == nil
				return
			end

			prev.next = current_node.next
		end
	end

	def create_linked_list(input)
		@head_node = nil

		input.each do |n|
			insert_node(n)
		end
	end

	def insert_node(value)
		new_node = NodeLinkedList.new(value)
		current_node = @head_node

		if current_node.nil?
			@head_node = new_node
			return
		end

		while current_node.next != nil
			current_node = current_node.next
		end

		current_node.next = new_node
	end

	def reverse_linked_list
		current_node = @head_node
		prev_node = nil
		next_node = nil

		while current_node != nil
			new_node = current_node.next
			current_node.next = prev_node
			prev_node = current_node
			current_node = new_node
		end

		@head_node = prev_node
	end

	def print_linked_list
		current_node = @head_node
		while current_node != nil
			puts current_node.data
			current_node = current_node.next
		end
	end

	def perform_task
		different_task = 
				{quit: 0,
				search_element: 1,
				delete_node: 2,
				insert_node: 3,
				reverse_ll: 4,
				print_ll: 5,
			 	}

		puts "#{different_task[:quit]}: Quit",
			 "#{different_task[:search_element]}: Search an element",
			 "#{different_task[:delete_node]}: Delete an element",
			 "#{different_task[:insert_node]}: Insert an element",
			 "#{different_task[:reverse_ll]}: Reverse Linked list",
			 "#{different_task[:print_ll]}: Print Linked List"

		loop do
			print "\nEnter your choice : "
			task = gets
			if(task =~ /^\d+$/)
				case task.to_i
				when different_task[:quit]
					break

				when different_task[:search_element]
					puts "enter no. to search"
					value = gets
					puts search_element(value.to_i)

				when different_task[:delete_node]
					puts "enter no. to Delete"
					value = gets
					delete_node(value.to_i)
		
				when different_task[:insert_node]
					correct_input = true
					input = gets	
					input_arr = input.split(",")

					if check_input_array(input_arr)
						numbers = input_arr.map(&:to_i)
						create_linked_list(numbers)
					else
						puts "wrong Input"
					end


				when different_task[:reverse_ll]
					reverse_linked_list

				when different_task[:print_ll]
					print_linked_list

				else puts "Please Choose the Correct Option"
				end
			else
				puts "wrong Input"
			end 
		end 
	end
end