require 'spec_helper'
require 'modules/error_handler_module'
require 'context/error_handler_content'

describe ErrorHandlerModule do
  include_context 'error_handler_content' do
    subject { DummyErrorHandler.new }

    it 'raises an expected error' do
      expect { subject.send(:raise_error, :invalid_file_name) }.to raise_error(RuntimeError, invalid_file_name_error)
      expect { subject.send(:raise_error, :incorrect_data_format) }.to raise_error(RuntimeError, data_format_error)
      expect { subject.send(:raise_error, :unexpected_arguments) }.to raise_error(RuntimeError, arguments_error)
      expect { subject.send(:raise_error, :unexpected_error) }.to raise_error(RuntimeError, unexpected_error)
    end

    class DummyErrorHandler
      include ErrorHandlerModule
    end
  end
end
