class String
	def integer?
		Integer(self)!=nil rescue false
	end

	def integer_array (input_arr)
		numbers=[]
		input_arr.each do |n|
			if(n.integer?)
				numbers.append(n.to_i)
			else
				puts "wrong input format"
				numbers=[]
				break
			end
		end
		numbers
	end
					

end