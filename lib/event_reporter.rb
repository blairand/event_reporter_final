require_relative 'event_reporter/version'
require_relative 'event_reporter/save_to'
require_relative 'event_reporter/load_new_file'
require_relative 'event_reporter/help_conditional'
require 'csv'
require 'date'

module EventReporter

class Parser

  def initialize
    @people = []
    @list = []
    @queue = []
    @contents = ""
  end

def width #column width for 'queue print'
    first_name_length = [12]
    last_name_length = [12]
    email_length = []
    city_length = []
    street_length = []
    @queue.each do |person|
      first_name_length << person[:first_name].length
      last_name_length << person[:last_name].length
      email_length << person[:email].length
      city_length << person[:city].length
      street_length << person[:street].length
    end
    width = Hash.new(12)
    width[:first_ljust] = first_name_length.max
    width[:last_ljust] =  last_name_length.max
    width[:email_ljust] = email_length.max
    width[:city_ljust] =  city_length.max
    width[:street_ljust] = street_length.max
    width
  end

def display_queue(a,b,c,d,e) #prints the queue to the page
    puts "\n\n#{"LAST NAME".ljust(a," ")}|#{"FIRST NAME".ljust(b," ")}|"+
            "#{"EMAIL".ljust(c," ")}|#{"ZIPCODE".ljust(10," ")}|#{"CITY".ljust(d," ")}|"+
            "#{"STATE".ljust(5," ")}|#{"ADDRESS".ljust(e," ")}|#{"PHONE".ljust(13," ")}"
     @queue.each_with_index do |person,i|
      puts "#{person[:last_name].ljust(a," ")}|#{person[:first_name].ljust(b," ")}|"+
              "#{person[:email].ljust(c," ")}|#{person[:zipcode].ljust(10," ")}|"+
              "#{person[:city].ljust(d," ")}|#{person[:state].upcase.ljust(5," ")}|"+
              "#{person[:street].to_s.ljust(e," ")}|#{person[:phone].ljust(13," ")}"
      if i % 10 == 0 && i != 0
        puts "Showing Matches #{i}-#{i+10} of #{@queue.length}"
        gets
      end
    end
end

  def queue_print(input)#prints the queue, if it needs to be sorted then it sorts the queue and then prints it.
    if input == "print"
      display_queue(width[:last_ljust],width[:first_ljust],width[:email_ljust],width[:city_ljust],width[:street_ljust])
    else
    @queue = @queue.sort_by{|person| person[input.to_sym]}
    queue_print("print")
  end
  puts "\n\n\n\n"
end

def queue(input)
  parts = input.split
  command = parts[0]
  case command
  when 'count' then puts "Found #{@queue.count} Records"
  when 'clear' then  puts "Queue Cleared..." && @queue = []
  when 'print' then queue_print(parts[-1])
  when 'save' then EventReporter::SaveTo.new(parts[-1],@queue)
  else
    puts "What would you like to queue?"
  end
end

def find_first_name(input)
  @queue = @people.select{|key,value| key[:first_name]==input}
  puts "Found #{@queue.count} records"
end

def find_last_name(input)
  @queue = @people.select{|key,value| key[:last_name]==input}
  puts "Found #{@queue.count} records"
end

def find_by_city(input)
  @queue = @people.select{|key,value| key[:city]==input}
  puts "Found #{@queue.count} records"
end

def find_by_state(input)
  @queue = @people.select{|key,value| key[:state]==input}
  puts "Found #{@queue.count} records"
end

def find_by_zip(input)
  @queue = @people.select{|key,value| key[:zipcode]==input}
  puts "Found #{@queue.count} records"
end

def find(input)
  parts = input.split
  command = parts[0]
  message = parts[1..-1].join(" ")
  case command
  when 'first_name' then find_first_name(message) #find first_name mary
  when 'last_name' then find_last_name(message) #find last_name smith
  when 'city' then find_by_city(message)
  when 'state' then find_by_state(message)
  when 'zipcode' then find_by_zip(message)
  else puts "What would you like to find?"
  end
end

def run
  command = ""
  while command != "quit"
    printf "enter command: "
    input = gets.chomp.to_s.downcase 
    parts = input.split
    message = parts[1..-1].join(" ")
    command = parts[0]
    case command
    when 'quit' then puts "Goodbye!"
    when 'load'
      @people = EventReporter::LoadNewFile.new(parts[-1])
      @people = @people.returner
    when 'find' then find(message)
    when 'queue' then queue(message)
    when 'help'
      a = EventReporter::HelpText.new
      a.show_help(input)
    else
     puts "Sorry, I don't know how to #{command}."
   end
 end
end

end

end