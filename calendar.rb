class Event
	@@event_count = 0

	def initialize(name, date, location)
		@name = name
		@date = date
		@location = location
		@@event_count += 1
	end

	def self.get_count
		return @@event_count
	end

	def self.remove_count
		@@event_count -= 1
	end	

	def get_name
		return @name
	end	

	def get_date
		return @date
	end
	
	def get_location
		return @location
	end
	
	def print
		puts "\nEvent: #{@name}"
		puts "Date: #{@date}"
		puts "Location: #{@location}\n"
		
	end	
end

	
def start_calendar
	calendar = []
	quit = false

	while(!quit)
		puts "\nWelcome to Calendar!"
		puts "Choose one of the below options to begin." 
		puts "\n1. Add an event"
		puts "2. Show an event (by index)"
		puts "3. Delete an event (by index)"
		puts "4. Total number of events saved"
		puts "5. Show all events (sorted by date)"
		puts "6. Exit the program"
		print "\n"

		option_select = gets.chomp.to_i

		if (option_select==1)
			add_event(calendar)
		elsif(option_select==2)
			show_event(calendar)
		elsif(option_select==3)
			delete_event(calendar)
		elsif(option_select==4)
			get_count
		elsif(option_select==5)
			show_all(calendar)
		elsif(option_select==6)
			puts "Goodbye"
			quit=true
		else 
			puts "Invalid input"
		end							
	end
end

def add_event (calendar)
	puts "What is the name of your event?"
	name = gets.chomp.capitalize!

	puts "\nWhen is your event?"
	date = gets.chomp

	puts "\nWhere is your event?"
	location = gets.chomp

	event = Event.new(name, date, location)
	calendar.push(event)
	return calendar
end

def show_event (calendar)
	puts "Which event would you like to show?"
	puts "Select using an integer to represent the index"
	index = gets.chomp.to_i
	if (index < Event.get_count)
		event = calendar[index]
		event.print
	else
		puts "That is not an event on the calendar\n"
	end		
end

def delete_event (calendar)
	puts "Which event would you like to delete? Select using an integer index."
	index = gets.chomp.to_i
	if (index < Event.get_count)
		Event.remove_count
		calendar.delete_at(index)
	else
		puts "That is not an event on the calendar\n"	
	end
end

def get_count 
	puts "Total Events: #{Event.get_count}"
end	

def show_all (calendar)
	calendar.sort! {|a, b| a.get_date <=> b.get_date}
	calendar.each { |event|
		event.print
		puts "\n" 
	}
end


start_calendar







