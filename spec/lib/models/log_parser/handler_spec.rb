require 'spec_helper'
require 'models/log_parser/handler'
require 'context/error_handler_content'

describe LogParser::Handler do
  include_context 'error_handler_content' do
    subject { LogParser::Handler.new(parsed_file: parsed_data) }

    context 'when handler receives correct parsed data' do
      let(:parsed_data) do
        [
          %w[test/1 ip_1],
          %w[test/1 ip_2],
          %w[test/2 ip_1],
          %w[test/2 ip_1],
          %w[test/2 ip_1]
        ]
      end

      it 'returns expected data' do
        result = subject.handle_data
        expect(result[:most_viewed][0]).to eq(['test/2', 3])
        expect(result[:most_viewed][1]).to eq(['test/1', 2])
        expect(result[:unique_viewed][0]).to eq(['test/1', 2])
        expect(result[:unique_viewed][1]).to eq(['test/2', 1])
      end
    end

    context 'when handler receives incorrect parsed data' do
      let(:parsed_data) { :incorrect_data_format }

      it 'raises incorrect data format error' do
        expect { subject.handle_data }.to raise_error(RuntimeError, data_format_error)
      end
    end
  end
end
