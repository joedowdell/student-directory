# This is the method for the interactive menu

def interactive_menu
	students = []
	loop do 
		#1. print the menu and ask the user what to do
		puts "1. Input the students"
		puts "2. Show the students"
		puts "9. Exit"
		#2. read the input and save it into a variable
		selection = gets.chomp
		#3. do what the user has asked
		case selection
			when "1"
				#input the students
				students = student_input(studentsgit )
			when "2"
				#show the students
				print_students(students)
				student_tally(students)
			when "9"
				exit #terminate the program
			else 
				puts "I don't know what you want, try again"
		end

	end
end



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

# This is a method to sort students by name and cohort
def sort_cohort(students)
	students.sort_by! { |student| [student[:cohort], student[:name], student[:nationality]] }
	remove_false_students(students)
end

# This is a method to remove anyone from a cohort that is after than June

=begin
	
def remove_false_students(students)
	students = students.delete_if { |student| student[:cohort] == "August" || student[:cohort] ==  "September" || student[:cohort] ==  "October" }
	students
end
=end

interactive_menu

#student_input(students)
# remove_false_students(students)
#sort_cohort(students)
#student_tally(students)
#puts students



