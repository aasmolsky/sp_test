require_relative '../../modules/error_handler_module'

module LogParser
  class Handler
    include ErrorHandlerModule

    attr_reader :parsed_data, :mapped_data

    def initialize(parsed_file: file_data)
      @parsed_data = parsed_file
      @mapped_data = {}
    end

    def handle_data
      raise_error(:incorrect_data_format) if invalid_parsed_data_format

      map_parsed_data

      {
        most_viewed: most_viewed,
        unique_viewed: most_unique_page_views
      }
    end

    private

    def map_parsed_data
      parsed_data.each do |data_line|
        mapped_data[data_line.first] ||= initial_page_stats

        mapped_data[data_line.first][:views] += 1
        mapped_data[data_line.first][:unique_ips] |= [data_line.last]
      end
    end

    def initial_page_stats
      {
        views: 0,
        unique_ips: []
      }
    end

    def most_viewed
      sorted_data = mapped_data.sort_by { |_, data| -data[:views] }

      sorted_data.map { |k, v| [k, v[:views]] }
    end

    def most_unique_page_views
      sorted_data = mapped_data.sort_by { |_, data| -data[:unique_ips].length }

      sorted_data.map { |k, v| [k, v[:unique_ips].count] }
    end

    def invalid_parsed_data_format
      !parsed_data.is_a?(Array) || parsed_data.detect { |data_line| !data_line.is_a?(Array) }
    end
  end
end
