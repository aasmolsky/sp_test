shared_context 'error_handler_content' do
  let(:invalid_file_name_error) { 'File not found. Provide valid file name please.' }
  let(:data_format_error) { 'Incorrect data received. Please contact your Administrator.' }
  let(:arguments_error) { 'The script allows only log file name as its parameter. Please try again.' }
  let(:unexpected_error) { 'An unexpected error occurred. Please contact your Administrator.' }
end
