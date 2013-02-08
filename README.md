[![Code Climate](https://codeclimate.com/github/blairand/event_reporter_final.png)](https://codeclimate.com/github/blairand/event_reporter_final)

# EventReporter

EventReporter is a CSV parser and sorter. you can load a CSV and then search it. 

## Cloning!

    $ git clone git://github.com/blairand/event_reporter_final.git
    

### Usage

    $ bin/event_reporter

## Installation from RubyGems

    $ gem install the_only_event_reporter_ever

## Usage

After installation run:
    
    $ event_reporter

Then Type 'load <filename>' to load records from a CSV

    $ load event_attendees.csv

Try these commands

    $ find first_name sarah

    $ queue Print

    $ queue save to <filename> 

### Saving the queue accepts extensions JSON, XML, TXT, CSV.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
