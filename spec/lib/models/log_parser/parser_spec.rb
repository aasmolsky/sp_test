require 'spec_helper'
require 'models/log_parser/parser'
require 'context/error_handler_content'

describe LogParser::Parser do
  include_context 'error_handler_content' do
    subject { LogParser::Parser.new(argv) }

    context 'when script receives correct params' do
      let(:argv) { %w[webserver.log] }

      it 'parses data from log file' do
        parsed_file = subject.parse

        expect(parsed_file[0]).to eq(%w[test/1 ip_1])
        expect(parsed_file[1]).to eq(%w[test/1 ip_2])
        expect(parsed_file[2]).to eq(%w[test/2 ip_1])
        expect(parsed_file[3]).to eq(%w[test/2 ip_1])
        expect(parsed_file[4]).to eq(%w[test/2 ip_1])
      end
    end

    context 'when script receives deficient params' do
      let(:argv) { [] }

      it 'raises data from log file' do
        expect { subject.parse }.to raise_error(RuntimeError, invalid_file_name_error)
      end
    end

    context 'when script receives excess params' do
      let(:argv) { %w[webserver.log unexpected_argument.log] }

      it 'raises data from log file' do
        expect { subject.parse }.to raise_error(RuntimeError, arguments_error)
      end
    end

    context 'when log file is not found' do
      let(:argv) { %w[nonexistent.log] }

      it 'raises data from log file' do
        expect { subject.parse }.to raise_error(RuntimeError, file_not_found_error)
      end
    end
  end
end
