
# This is our student array to store students
students = []

def student_input(students)
	puts "Please enter the name of the first student and press RETURN"
	puts "or press RETURN to exit"
	name = gets.chomp
	puts "Please enter the cohort month"
	cohort = gets.chomp
	puts "Please enter student's nationality"
	nationality = gets.chomp
	students << { name: name, cohort: cohort, nationality: nationality}
end

student_input(students)

puts students

