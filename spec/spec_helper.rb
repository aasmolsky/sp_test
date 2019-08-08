ENV['SPEC_FILE_DIR'] = "#{Dir.pwd}/spec/fixtures"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.order = 'random'

  app_root = File.expand_path(__dir__, __FILE__)

  load_paths = []
  load_paths += Dir[File.expand_path("#{app_root}/{lib}")]
  load_paths += Dir[File.expand_path("#{app_root}/{spec}")]
  load_paths.each { |load_path| $LOAD_PATH.unshift(load_path) unless $LOAD_PATH.include?(load_path) }
end
