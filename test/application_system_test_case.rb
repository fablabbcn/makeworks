require "test_helper"
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include CapybaraSelect2
  Capybara.configure do |config|
    config.ignore_hidden_elements = false
    config.server_host = "0.0.0.0"
    config.app_host = "http://#{ENV.fetch("HOSTNAME")}:#{Capybara.server_port}"
  end

  options = if ENV["CHROME_SERVER_HOST"]
    { browser: :remote, url: "http://#{ENV['CHROME_SERVER_HOST']}:4444" , }
  else
    {}
  end

  driven_by :selenium, using: ENV.fetch('SYSTEM_TEST', 'chrome').to_sym, screen_size: [1400, 1400], options: options do |driver_options|
    driver_options.add_argument "disable-dev-shm-usage"
  end
end
