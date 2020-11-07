require "capybara"
require "capybara/cucumber"
require "capybara/dsl"
require "capybara-screenshot/cucumber"
require "selenium-webdriver"
require "rspec"
require "httparty"
require "site_prism"
require "faker"
require "report_builder"
require "rubocop"
require "base64"
require "json-schema"
require "rspec"
require_relative "commons/dsl.rb"

include Common

World(Common)

BROWSER = ENV["BROWSER"]
CONFIG = load_config_env

Capybara.register_driver :selenium do |app|

  if BROWSER.eql?("firefox")
    puts "entro firefox"
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
  elsif BROWSER.eql?("chrome")
    puts "entro chrome"
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  elsif BROWSER.eql?("internet_explorer")
    puts "entro internet_explorer"
    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
  elsif BROWSER.eql?("chrome_headless")
    puts "entro headless"
    Capybara::Selenium::Driver.new(app, :browser => :chrome, desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      'goog:chromeOptions' => {'args' => ['headless', 'no-sandbox', 'disable-gpu', 'disable-dev-shm-usage'] }
      )
      )
  end
  
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG["app_host"]
  config.default_max_wait_time = CONFIG["default_max_wait_time"]
  $baseurl_api = CONFIG["baseurl_api"]
end

navegador = Capybara.current_session.driver.browser
navegador.manage.window.resize_to(1280, 780)