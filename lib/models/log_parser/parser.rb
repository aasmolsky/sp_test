require_relative '../../modules/error_handler_module'

module LogParser
  class Parser
    include ErrorHandlerModule

    attr_reader :params

    def initialize(argv)
      @params = argv
    end

    def parse
      raise_error(:unexpected_arguments) if params.count > 1
      file_data = read_file(file_name)

      parse_file(file_data)
    end

    private

    def file_name
      params.detect { |file_name| /^\S+\.log$/ =~ file_name } || raise_error(:invalid_file_name)
    end

    def read_file(name)
      path = "#{ENV['SPEC_FILE_DIR'] || Dir.pwd}/#{name}"

      if File.exist?(path) && File.readable?(path)
        File.read(path)
      else
        raise_error(:file_not_found)
      end
    end

    def parse_file(data)
      data.split("\n").map { |line| line.split(' ') }
    end
  end
end
