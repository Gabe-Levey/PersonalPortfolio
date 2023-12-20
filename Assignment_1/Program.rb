=begin
Gabriel Levey
CSC 415-01
Assignment #1
=end

require "csv"
require_relative 'Student'
require_relative 'Group'
require_relative 'Database'

def sort_stu_list(list, first_i, last_i, info_index)    # Quicksort method; Sorts a Student array and returns it
	if first_i < last_i
		pivot_i = get_pivot_index(list, first_i, last_i, info_index)
		sort_stu_list(list, first_i, pivot_i - 1, info_index)
		sort_stu_list(list, pivot_i + 1, last_i, info_index)
	end
	return list
end

def get_pivot_index(list, first_i, last_i, info_index)    # Partition method for sort_stu_list
	pivot = list[last_i]
	pivot_i = first_i
	num = first_i
	while num < last_i
		if list[num].get_info(info_index) <= pivot.get_info(info_index)
			stu = list[num]
			list[num] = list[pivot_i]
			list[pivot_i] = stu
			pivot_i += 1
		end
		num += 1
	end
	stu = list[pivot_i]
	list[pivot_i] = pivot
	list[last_i] = stu
	return pivot_i
end

def show_menu1    # Displays menu1
	puts ""
	puts "-Select an option-"
	puts "  PRINT student list"
	puts "  GET student"
	puts "  MODIFY student"
	puts "  ADD student"
	puts "  REMOVE student"
	puts "  NEXT menu"
	puts ""
end

def show_menu2    # Displays menu2
	puts ""
	puts "-Select group criteria-"
	puts "  0 - first_name"
	puts "  1 - last_name"
	puts "  2 - email"
	puts "  3 - section"
	puts "  4 - major1"
	puts ""
end

def set_crit_type(cmd2)    # Returns the type of criteria as a string
	if cmd2 == 0
		return "first_name"
	elsif cmd2 == 1
		return "last_name"
	elsif cmd2 == 2
		return "email"
	elsif cmd2 == 3
		return "section"
	else
		return "major1"
	end
end

data = Database.new    # Stores all Student and Group instances

print "What file would you like to load? "    # Fills stu_list with data from a files
filename = gets.chomp
puts "Extracting from #{filename}..."
table = CSV.parse(File.read(filename), headers:true)
for r in 0...table.length
	data.stu_list.push(Student.new(table.by_row[r].to_s))
end
#data.stu_list.pop    # Erases an empty Student instance at last index of stu_list; Only occurs when Program.rb is run on the VM
data.print_stu_list
puts "Data extraction complete."

show_menu1    # Allows the user to modify the elements stored in data.stu_list
print "Enter selection here: "
cmd1 = gets.chomp
cmd1.upcase!
while data.menu1(cmd1)
	show_menu1
	print "Enter selection here: "
	cmd1 = gets.chomp
	cmd1.upcase!
end

show_menu2    # Establishes criteria for Groups and sorts data.stu_list accordingly
print "Enter info index here: "
cmd2 = gets.chomp.to_i
while cmd2 < 0 || cmd2 > 4    # Checks if cmd2 is out of bounds
	puts "Invalid input."
	show_menu2
	print "Enter info index here: "
	cmd2 = gets.chomp.to_i
end
crit_type = set_crit_type(cmd2)    # Displayed in output file
data.stu_list = sort_stu_list(data.stu_list, 0, data.stu_list.length - 1, cmd2)    # Sorts data.stu_list based off of the desired criteria

menu3 = true    # Sets maximum group size
puts "There are #{data.stu_list.length} students total, which means the maximum group size can't exceed #{(data.stu_list.length / 2).to_f.ceil}."
while menu3    # Loop ends when menu3 is false
	print "What is the maximum amount of students per group? "
	size = gets.chomp.to_i    # Integer value; Number of groups that will be created
	if size > (data.stu_list.length / 2).to_f.ceil || size <= 1    # Checks if the number of groups will be at least 2
		puts "Invalid input."
	else
		Group.set_max_size(size)
		menu3 = false
	end
end

data.group_list.push(Group.new)    # Fills data.group_list with filled Group instances
data.stu_list.each do |stu|
	if data.group_list.last.students.length == Group.get_max_size    # Checks if the current group is full
		data.group_list.push(Group.new)
	end
	data.group_list.last.add_to_group(stu)
end
data.balance_groups
data.group_list.last.students = sort_stu_list(data.group_list.last.students, 0, data.group_list.last.students.length - 1, cmd2)

output = File.open("groups.txt", "w")    # Outputs group_list to groups.txt
output.puts "Number of groups: #{data.group_list.length}"
output.puts "Maximum group size: #{Group.get_max_size}"
output.puts "Group criteria: #{crit_type}"
2.times { output.puts "" }
i = 0
data.group_list.each do |group|    # Prints each group onto the output file
	output.print "-Group "
	if i < 10
		output.print "00#{i}-"
	elsif i < 100
		output.print "0#{i}-"
	else
		output.print "#{i}-"
	end
	output.puts "        #{group.students.length} students"
	group.students.each { |stu| output.puts stu.display_line }
	output.puts ""
	i += 1
end
output.close
puts "List of groups has been recorded on groups.txt"