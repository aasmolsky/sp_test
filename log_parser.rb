#!/usr/bin/env ruby

require_relative 'lib/models/parser_processor'

LogParser::ParserProcessor.new.process_log_file
