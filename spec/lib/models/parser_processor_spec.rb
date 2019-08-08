# Parser controller performs 3 main tasks: Parse log file, Handle file data, Console log result.

require 'spec_helper'
require 'models/parser_processor'

describe LogParser::ParserProcessor do
  let(:parser_mock) do
    # Parser object should has parse method
    parsed_file = double(parse: :parsed_file)
    double(new: parsed_file)
  end
  let(:handler_mock) do
    # Handler object should has handle_data method
    handler = double(handle_data: :handled_data)
    double(new: handler)
  end
  let(:logger_mock) do
    # Logger object should has process_file method
    logger = double(process_file: :expected_result)
    double(new: logger)
  end

  subject { LogParser::ParserProcessor.new(parser: parser_mock, handler: handler_mock, logger: logger_mock) }

  it 'processes webserver log' do
    expect(subject.process_log_file).to eq(:expected_result)
  end
end
