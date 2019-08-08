module ErrorHandlerModule
  private

  def raise_error(error_code)
    raise errors(error_code)
  end

  def errors(error_code)
    AVAILABLE_ERRORS[error_code] || AVAILABLE_ERRORS[:unexpected_error]
  end

  AVAILABLE_ERRORS = {
    file_not_found: 'Log file was not found. Please put webserver.log file into the Root dir.',
    invalid_file_name: 'Incorrect name received. Provide valid log file name please.',
    incorrect_data_format: 'Incorrect data received. Please contact your Administrator.',
    unexpected_arguments: 'The script allows only log file name as its parameter. Please try again.',
    unexpected_error: 'An unexpected error occurred. Please contact your Administrator.'
  }.freeze
end
