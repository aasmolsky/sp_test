require_relative 'log_parser/parser'
require_relative 'log_parser/handler'
require_relative 'log_parser/logger'

module LogParser
  class ParserProcessor
    attr_reader :parser_class, :handler_class, :logger_class

    def initialize(
      parser: Parser,
      handler: Handler,
      logger: Logger
    )
      @parser_class = parser
      @handler_class = handler
      @logger_class = logger
    end

    def process_log_file
      logger.process_file
    end

    private

    def file
      parser_class.new(ARGV).parse
    end

    def handled_data
      handler_class.new(parsed_file: file).handle_data
    end

    def logger
      logger_class.new(data: handled_data)
    end
  end
end
