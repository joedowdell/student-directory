
# This is our student array to store students
students = []

# This is the method to take input of student details
def student_input(students)
	puts "Please enter the name of the first student and press RETURN"
	puts "or press RETURN to exit"
	name = gets.chomp
		while !name.empty?
			puts "Please enter the cohort month"
			cohort = gets.chomp.capitalize.to_sym
				if cohort.empty?
						cohort = :June
				end 
			puts "Please enter student's nationality"
			nationality = gets.chomp
				
			students << { name: name, cohort: cohort, nationality: nationality}
			puts "Please enter name of next student and press RETURN to continue, or press RETURN to exit"
			name = gets.chomp
		end
		students
end

# This is the method to print cohort infomation to the screen
def print_students(students)
	puts "This is a list of all students in the Makers Academy database"
	students.each.with_index(1) do |student, index|
		puts "\t#{index}. #{student[:name]}, #{student[:cohort]}, #{student[:nationality]}"
	end
	
end

student_input(students)
print_students(students)
puts students


