require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'httparty'
require 'site_prism'
require 'faker'
require 'report_builder'
require 'rubocop'
require 'base64'
require 'json-schema'
require_relative "commons/dsl.rb"

include Common

World(Common)

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "chrome_headless"
  @driver = :selenium_chrome_headless
when "internet_explorer"
  @driver = :internet_explorer
else
  puts "Invalid Browser"
end

CONFIG = load_config_env

Capybara.register_driver :selenium do |app|
  if ENV["BROWSER"].eql?('firefox')
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  elsif ENV["BROWSER"].eql?('chrome')
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  else ENV["BROWSER"].eql?('chrome_headless')
       Capybara::Selenium::Driver.new(app, browser: :chrome,
                                           desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                                             'chromeOptions' => { 'args' => ['--headless',
                                                                             'disable-gpu',
                                                                             '--disable-dev-shm-usage',
                                                                             '--no-sandbox'] }
                                           ))
  end
end


Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["app_host"]
  config.default_max_wait_time = CONFIG["default_max_wait_time"]
  $baseurl_api = CONFIG["baseurl_api"]
end