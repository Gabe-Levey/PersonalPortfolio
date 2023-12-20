=begin
Gabriel Levey
CSC 415-01
Assignment #1
=end

class Group
	require_relative 'Student'
	@@max_size    # Integer value

	attr_accessor :students
	def initialize
		@students = Array.new    # Stduent array
	end

	def Group.get_max_size    #Returns @@max_size
		return @@max_size
	end

	def Group.set_max_size(num)    # Sets @@max_size
		@@max_size = num
	end

	def add_to_group(member)    # Adds a Student to @students
		@students.push(member)
	end

	def remove_last    # Removes the last Student in @students and returns it
		return @students.pop
	end
end