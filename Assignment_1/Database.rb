=begin
Gabriel Levey
CSC 415-01
Assignment #1
=end

class Database
	require_relative 'Student'
	require_relative 'Group'

	attr_accessor :stu_list
	attr_accessor :group_list
	def initialize
		@stu_list = Array.new    # Array of every Student instance
		@group_list = Array.new    # Array of every Group instance
	end

	def print_stu_list    # Prints the elements of @stu_list
		i = 0
		@stu_list.each do |stu|
			if i < 10
				print "000#{i} "
			elsif i < 100
				print "00#{i} "
			elsif i < 1000
				print "0#{i} "
			else
				print "#{i} "
			end
			puts stu.display_line
			i += 1
		end
	end

	def menu1(cmd1)    # Selects an option from menu1
		stay_in_menu = true
		if cmd1 == "PRINT"    # User typed "PRINT"
			print_stu_list
		elsif cmd1 == "GET"    # User typed "GET"
			puts @stu_list[get_index("student ID", @stu_list)].display_line
		elsif cmd1 == "MODIFY"    # User typed "MODIFY"
			temp = get_index("student ID", @stu_list)
			@stu_list[temp] = modify_stu(@stu_list[temp])
			puts "Student modified."
		elsif cmd1 == "ADD"    # User typed "ADD"
			if create_stu
				puts "Student added. There are now #{@stu_list.length} students."
			else
				puts "Student already exists."
			end
		elsif cmd1 == "REMOVE"    # User typed "REMOVE"
			puts ""
			temp = get_index("student ID", @stu_list)
			puts @stu_list[temp].display_line
			@stu_list.delete_at(temp)
			puts "Student removed. There are now #{@stu_list.length} students."
		elsif cmd1 == "NEXT"    # User typed "NEXT"
			stay_in_menu = false
		else    # Input is not a valid selection
			puts "Invalid input."
		end
		return stay_in_menu
	end

	def balance_groups    # Makes Groups as evenly split as possible
		diff = Group.get_max_size - @group_list.last.students.length
		if diff > 1
			curr_i = @group_list.length - 2
			while @group_list.last.students.length < Group.get_max_size - 1
				@group_list.last.add_to_group(@group_list[curr_i].remove_last)
				curr_i -= 1
			end
		end
	end

	private
	def get_index(type_i, list)    # Search method; Returns an index location from the specified list
		find_i = -1
		while find_i >= list.length || find_i < 0
			print "Enter #{type_i} here: "
			find_i = gets.chomp.to_i
			puts "Invalid input." if find_i >= list.length || find_i < 0    # Checks if find_i is out of bounds or blank
		end
		return find_i
	end

	private
	def show_info_menu    # Displays sub-menu containing index values for info fields
		puts "  0 - first_name"
		puts "  1 - last_name"
		puts "  2 - email"
		puts "  3 - section"
		puts "  4 - major1"
		puts "  5 - major2"
		puts "  6 - minor1"
		puts "  7 - minor2"
		puts ""
	end

	private
	def modify_stu(stu)
		new_info = ""
		puts stu.display_line
		show_info_menu
		info_index = get_index("info index", stu.stu_info)
		if info_index == 2    # Special case for modifying email
			new_info = create_email
			stu.change_info(info_index, new_info)
		else
			new_info = create_info_field("replacement info")
			stu.change_info(info_index, new_info)
		end
		puts ""
		puts stu.display_line
		return stu
	end

	private
	def create_stu    # Creates a Student and adds it to @stu_list
		valid = false
		first_name = create_info_field("first_name")
		last_name = create_info_field("last_name")
		email = create_email
		section = create_info_field("section")
		major1 = create_info_field("major1")
		print "Enter major2 (Leave blank and press Enter if not applicable): "    # Optional field
		major2 = gets.chomp
		print "Enter minor1 (Leave blank and press Enter if not applicable): "    # Optional field
		minor1 = gets.chomp
		print "Enter minor2 (Leave blank and press Enter if not applicable): "    # Optional field
		minor2 = gets.chomp
		stu = Student.new("#{first_name},#{last_name},#{email},#{section},#{major1},#{major2},#{minor1},#{minor2}")
		puts ""
		puts stu.display_line
		unless check_duplicate(stu)    # Checks is new_stu already exists by using required info fields
			@stu_list.push(stu)
			valid = true
		end
		return valid
	end

	private
	def create_info_field(field_name)    # Creates and returns a required info field for a Student
		info_field = ""
		while info_field == ""
			print "Enter #{field_name} here: "
			info_field = gets.chomp
			puts "Invalid input." if info_field == ""
		end
		return info_field
	end

	private
	def create_email    # Creates and returns an email for a Student
		user = ""
		while user == ""
			print "Enter email username (do not type @domain): "
			user = gets.chomp
			puts "Invalid input." if user == ""
		end
		domain = ""
		while domain == ""
			print "Enter email domain (do not type @): "
			domain = gets.chomp
			puts "Invalid input." if domain == ""
		end
		return "#{user}@#{domain}"
	end

	private
	def check_duplicate(entry)    # Checks if the Student paramator already exists in @stu_list
		is_there = false
		@stu_list.each do |stu|
			ditto = 0
			for num in 0..4
				if stu.get_info(num) == entry.get_info(num)
					ditto += 1
				end
			end
			if ditto == 5
				is_there = true
				break
			end
		end
		return is_there
	end
end