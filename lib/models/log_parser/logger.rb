require_relative '../../modules/error_handler_module'

module LogParser
  class Logger
    include ErrorHandlerModule

    attr_reader :logging_data

    def initialize(data: log_data)
      @logging_data = data
    end

    def process_file
      raise_error(:incorrect_data_format) if incorrect_logging_data_format

      most_viewed
      unique_viewed
    end

    private

    def most_viewed
      puts '***** Most viewed pages *****'
      logging_data[:most_viewed].each do |page, views|
        puts "#{page}: #{views} visits"
      end
      puts "\n"
    end

    def unique_viewed
      puts '***** Most unique page views *****'
      logging_data[:unique_viewed].each do |page, visits|
        puts "#{page}: #{visits} unique views"
      end
    end

    def incorrect_logging_data_format
      return true unless logging_data.keys == %i[most_viewed unique_viewed]

      logging_data.values.any? do |data|
        !data.is_a?(Array) || data.any? { |data_line| !data_line.is_a?(Array) }
      end
    end
  end
end
