# This is the method for the interactive menu
@students = []
@filename = "students.csv"

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

# print the menu and ask the user what to do
def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to #{@filename}"
	puts "4. Load the list from #{@filename}"
	puts "9. Exit"
end

	#show the students
def show_students
	print_students
	student_tally
end

# do what the user has asked
def process(selection)
	case selection
		when "1"
			#input the students
			student_input
		when "2"
			show_students
		when "3"
			save_students
		when "4"
			load_students
		when "9"
			exit #terminate the program
		else 
			puts "I don't know what you want, try again"
	end
end

# This is the method to take input of student details
def student_input
	puts "Please enter the name of the first student and press RETURN"
	puts "or press RETURN to exit"
	name = STDIN.gets.chomp.capitalize
		while !name.empty?
			puts "Please enter the cohort month"
			cohort = STDIN.gets.chomp.capitalize.to_sym
				if cohort.empty?
						cohort = :June
				end 
			puts "Please enter student's nationality"
			nationality = STDIN.gets.chomp

			add_student(name,cohort,nationality)

			student_tally

			puts "Please enter name of next student and press RETURN to continue, or press RETURN to exit"
			name = STDIN.gets.chomp.capitalize
		end
		@students
end

# This method is to taly the number of students
def student_tally
	
	if @students.length == 1
		puts "There is #{@students.length} student in the database"
	else
		puts "There are #{@students.length} students in the database"
	end
	
end

# This is the method to print cohort infomation to the screen
def print_students
	if @students.empty? 
		puts "There are no students in the database!"
	else
		puts "This is a list of all students in the Makers Academy database"
		@students.each.with_index(1) do |student, index|
			puts "\t#{index}. #{student[:name]}, #{student[:cohort]}, #{student[:nationality]}"
		end
	end
end

# This is a method to sort students by name and cohort
def sort_cohort
	@students.sort_by! { |student| [student[:cohort], student[:name], student[:nationality]] }
	remove_false_students(@students)
end

# This is a method to save studetns into a csv
def save_students
	#open the file for writing
	file = File.open(filename = "students.csv" , "w")
	#iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort], student[:nationality]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
	puts "#{filename} is now saved"
end

def load_students(file_name = "students.csv")
	@filename = file_name
	file = File.open(file_name, "r")
	file.readlines.each do |line|
		name, cohort, nationality = line.chomp.split(',')
		add_student(name, cohort, nationality)
	end
	file.close
	puts "#{file_name} is now loaded"
end

def add_student(name, cohort, nationality)
	@students << {:name => name, :cohort => cohort.to_sym, :nationality => nationality}
end

def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
			puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
	
end

# This is a method to remove anyone from a cohort that is after than June

=begin
	
def remove_false_students(students)
	students = students.delete_if { |student| student[:cohort] == "August" || student[:cohort] ==  "September" || student[:cohort] ==  "October" }
	students
end
=end


#load_students
load_students
try_load_students
interactive_menu

#student_input(students)
# remove_false_students(students)
#sort_cohort(students)
#student_tally(students)
#puts students



