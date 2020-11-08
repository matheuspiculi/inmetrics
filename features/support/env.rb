require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'httparty'
require 'faker'
require 'site_prism'
require 'report_builder'
require 'rubocop'
require 'base64'
require 'json-schema'
require_relative "commons/dsl"
include CommonTools

World(CommonTools)

BROWSER = ENV['BROWSER']
CONFIG = YAML.load_file(File.join(Dir.pwd, '/features/support/config/config.yaml'))

Capybara.register_driver :selenium do |app|
  case BROWSER
  when 'firefox'
    Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
  when 'chrome'
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  when 'internet_explorer'
    Capybara::Selenium::Driver.new(app, browser: :internet_explorer)
  when 'chrome_headless'
    Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome('goog:chromeOptions' => { 'args' => %w[headless no-sandbox disable-gpu disable-dev-shm-usage] }))
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['app_host']
  config.default_max_wait_time = CONFIG['default_max_wait_time']
  $baseurl_api = CONFIG['baseurl_api']
end

navegador = Capybara.current_session.driver.browser
navegador.manage.window.resize_to(1366, 768)
