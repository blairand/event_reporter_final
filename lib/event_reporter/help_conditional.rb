module EventReporter

  class HelpText
    def initialize
      @command = ""
    end

    def queue_help(input)
      parts = input.split
      @command = parts[-1]
      case @command
      when 'count' then puts "\n\n\n\n\tType 'queue count' to count the queued records"
      when 'clear' then puts "\n\n\n\n\tType 'queue clear' to clear the queue."
      when 'print' then puts "\n\n\n\n\tType 'queue print' to print the queue."
      else
      end
    end

    def find_help(input)
      parts = input.split
      @command = parts[0]
      case @command
      when 'first_name' then puts "\n\n\nType 'find first_name <name>' to load the queue."
      when 'last_name' then puts "\n\n\nType 'find last_name <name>' to load the queue."
      when 'city' then puts "\n\n\nType 'find city <city>'. Example 'find city salt lake city'. "
      when 'state' then puts "\n\n\nType 'find state <state>' using the state initials."
      when 'zipcode' then puts "\n\n\nType 'find zipcode <zipcode>' to find records by zipcode."
      else
        puts "Type 'find <attribute> <criteria>'\nExample: 'find first_name sarah' "
      end
    end

    def load_help(input)

    end

  def empty_help
    puts "#{'-'*100}\n\n\n\n\t\tWelcome to Event Reporter."
    puts "\n\t\tSearch a CSV for specific names/cities/states/zipcodes and print them to the screen."
    puts "\n\t\tType 'load <filename.csv>'' to load records."
    puts "\n\t\tEnter 'find first_name sarah' to find people named sarah."
    puts "\n\t\tType 'queue print' to print out all records in the queue."
    puts "\n\t\tType 'queue print by <attribute> to sort the data by an attribute"
    puts "\n\t\tType 'queue save to filename' to save.\nJSON, XML, TXT and CSV are acceptable extensions."
  end


    def show_help(input) 
      parts = input.split
      if parts[-1] == "help"
        empty_help
      else
        message = parts[2..-1].join(" ")
        command = parts[1] 
        case command
        when 'load' then puts "Enter 'load <filename.csv>' to load records from a new file."
        when 'find' then find_help(message)
        when 'queue' then queue_help(message)
        else 
          puts "Sorry i cant help with #{input} "
        end
      end
    end

  end
end