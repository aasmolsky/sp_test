# Task
Write a ruby script (ruby_app) that:

* a. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
* b. Returns the following:
    * list of webpages with most page views ordered from most pages views to less page views e.g.:
      ```
      /home 90 visits /index 80 visits etc...
      ```
    * list of webpages with most unique page views also ordered e.g.:
      ```
      /about/2 8 unique views`
      /index 5 unique views etc...
      ```

# Run
* Clone and prepare to run
    * `$ git clone https://github.com/aasmolsky/sp_test.git`
    * `$ cd sp_test`
    * `$ bundle`
    * `$ chmod +x log_parser.rb`    
* Execute   
    * Rename `webserver_default.log` to `webserver.log` or add new `webserver.log` file from your host
    * Run `./log_parser.rb webserver.log`
    
# Tests
* Run `rspec` or `rspec <path-to-single-spec-file>`
    
# Code Analysis
* Run `rubocop` or `rubocop <path-to-file>`

# Requirements and extra capabilities
* Script allows random names of the log file. In this case:
    * File has to be located in the Root dir.  
    * File name should be consisted of any non-whitespace characters and has `.log` extension
    * To process file run `./log_parser.rb <file-name>`
