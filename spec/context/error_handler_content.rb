shared_context 'error_handler_content' do
  let(:file_not_found_error) { 'Log file was not found. Please put webserver.log file into the Root dir.' }
  let(:invalid_file_name_error) { 'Incorrect name received. Provide valid log file name please.' }
  let(:data_format_error) { 'Incorrect data received. Please contact your Administrator.' }
  let(:arguments_error) { 'The script allows only log file name as its parameter. Please try again.' }
  let(:unexpected_error) { 'An unexpected error occurred. Please contact your Administrator.' }
end
