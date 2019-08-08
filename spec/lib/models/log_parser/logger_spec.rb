# Logger gets data from Handler and returns result into console

require 'spec_helper'
require 'models/log_parser/logger'
require 'context/error_handler_content'

describe LogParser::Logger do
  include_context 'error_handler_content' do
    subject { LogParser::Logger.new(data: handled_data) }

    context 'when logger receives correct handled data' do
      let(:handled_data) do
        {
          most_viewed: [
            %w[test/1 100],
            %w[test/2 10]
          ],
          unique_viewed: [
            %w[test/3 101],
            %w[test/4 11]
          ]
        }
      end
      let(:expected_output) do
        output = []
        output << '***** Most viewed pages *****'
        output << 'test/1: 100 visits'
        output << "test/2: 10 visits\n"
        output << '***** Most unique page views *****'
        output << 'test/3: 101 unique views'
        output << "test/4: 11 unique views\n"

        output.join("\n")
      end

      it 'returns expected data' do
        expect { subject.process_file }.to output(expected_output).to_stdout
      end
    end

    context 'when logger receives incorrect handled data' do
      let(:handled_data) { { data: :incorrect_data } }

      it 'raises incorrect data format error' do
        expect { subject.process_file }.to raise_error(RuntimeError, data_format_error)
      end
    end
  end
end
