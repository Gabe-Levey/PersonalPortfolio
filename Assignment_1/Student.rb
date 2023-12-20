=begin
Gabriel Levey
CSC 415-01
Assignment #1
=end

class Student
	attr_reader :stu_info
	def initialize(entry)    # String paramator
		@stu_info = entry.split(",")    # String array
	end

	def get_info(info_index)    # Returns the element of @stu_info stored at the specified index; Index 0 = first name; 1 = last name; 2 = email; 3 = section; 4 = major1; 5 = major2; 6 = minor1; 7 = minor2
		return @stu_info[info_index]
	end

	def change_info(info_index, new_info)    # Changes the element of @stu_info stored at the specified index; Index 0 = first name; 1 = last name; 2 = email; 3 = section; 4 = major1; 5 = major2; 6 = minor1; 7 = minor2
		if info_index == 7 && (@stu_info[6] == nil || @stu_info[6] == "")    # Special case for when minor2 is selected while minor1 is empty
			@stu_info[6] = "#{new_info}"
		else
			@stu_info[info_index] = "#{new_info}"
		end
	end

	def display_line    # Returns the data stored in @stu_info
		return "#{get_info(0)},#{get_info(1)},#{get_info(2)},#{get_info(3)},#{get_info(4)},#{get_info(5)},#{get_info(6)},#{get_info(7)}"
	end
end