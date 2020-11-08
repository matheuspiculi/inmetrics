After do |scenario|
  file_path = 'log/screenshot.png'
  Capybara.current_session.driver.browser.save_screenshot(file_path)
  image = open(file_path, 'rb', &:read)
  encoded_image = Base64.encode64(image)
  attach(encoded_image, 'image/png')
end

at_exit do
  time = Time.now
  ReportBuilder.configure do |config|
    config.json_path = 'log/report.json'
    config.report_path = 'log/cucumber_web_report'
    config.report_types = [:json, :html]
    config.color = 'yellow'
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = 'InMetrics Report Web Automation Test Results'
    config.compress_images = false
    config.additional_info = { 'Project name' => 'InMetrics', 'Browser' => "#{BROWSER}", 'Environment' => 'Desafio', 'Report generated' => time }
  end
  ReportBuilder.build_report
end
