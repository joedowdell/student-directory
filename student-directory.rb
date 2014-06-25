
# This is our student array to store students
students = []

# This is the method to take input of student details
def student_input(students)
	puts "Please enter the name of the first student and press RETURN"
	puts "or press RETURN to exit"
	name = gets.chomp.capitalize
		while !name.empty?
			puts "Please enter the cohort month"
			cohort = gets.chomp.capitalize.to_sym
				if cohort.empty?
						cohort = :June
				end 
			puts "Please enter student's nationality"
			nationality = gets.chomp

			students << { name: name, cohort: cohort, nationality: nationality}

			student_tally(students)

			puts "Please enter name of next student and press RETURN to continue, or press RETURN to exit"
			name = gets.chomp.capitalize
		end
		students
end

# This method is to taly the number of students
def student_tally(students)
	
	if students.length == 1
		puts "There is #{students.length} student in the database"
	else
		puts "There are #{students.length} students in the database"
	end
	
end


# This is a method to sort students by name and cohort
def sort_cohort(students)
	students.sort_by! { |student| [student[:cohort], student[:name], student[:nationality]] }
	print_students(students)
end



# This is the method to print cohort infomation to the screen
def print_students(students)
	if students.empty? 
		puts "There are no students in the database!"
	else
	puts "This is a list of all students in the Makers Academy database"
		students.each.with_index(1) do |student, index|
			puts "\t#{index}. #{student[:name]}, #{student[:cohort]}, #{student[:nationality]}"
		end	
	end
	
end

student_input(students)
sort_cohort(students)
=begin
student_input(students)
sort_by_cohort(students)
print_students(students)
student_tally(students)
=end
# puts students



