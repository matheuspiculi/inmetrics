After do |scenario|
    add_screenshot
end
  
at_exit do
    time = Time.now
    ReportBuilder.configure do |config|
        config.json_path = "log/report.json"
        config.report_path = "log/cucumber_web_report"
        config.report_types = [:retry, :html]
        config.color = "yellow"
        config.report_tabs = %w[Overview Features Scenarios Errors]
        config.report_title = "InMetrics Report Web Automation Test Results"
        config.compress_images = false
        config.additional_info = { "Project name" => "InMetrics", "Browser" => "#{ENV["BROWSER"]}", "Environment" => "Oficial", "Report generated" => time }
    end
    ReportBuilder.build_report
end