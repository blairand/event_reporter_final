module EventReporter

class HelpText
  def initialize
    @command = ""
  end

  def help_queue(input)
    parts = input.split
    @command = parts[0]
    case @command
    when 'count' then puts "\n\n\n\n\tHelp Queue Count 'queue print' to print the queue. \n Enter 'queue clear' to clear the queue. \n"
    when 'clear' then puts "\n\n\n\n\tEnter 'queue print' to print the queue. \n Enter 'queue clear' to clear the queue. \n"
    when 'print' then puts "\n\n\n\nEnter 'queue print' to print the queue. \n Enter 'queue clear' to clear the queue. \n"
    else
    end
  end


  def show_help(input) 
    parts = input.split
    @command = parts[0]
    case @command
    when 'load' then puts "Enter 'load <filename.csv>' to load records from a new file."
    when 'find' then puts "Enter 'find <attribute> <criteria>' to load records into the Queue. \n Example: 'find first_name sarah' "
    when 'queue' 
      help_queue(parts[1..-1].join(" "))
    else 
      puts "#{'-'*100}\n\n\n\n\t\tWelcome to Event Reporter. \n\n\n\n\t\tYou can Search a CSV for specific names/cities/states/zipcodes and print them  
      \n\tType 'load <filename.csv>'' to load records\n\tEnter 'find first_name sarah' to find people named sarah. 
      \n Type 'queue print' to print out all records in the queue.\n Type 'queue print by <attribute> to sort the data by an attribute\n
      Type 'queue save to filename' to save the queue, JSON, XML, txt and CSV are acceptable extensions."
    end
  end

end

end