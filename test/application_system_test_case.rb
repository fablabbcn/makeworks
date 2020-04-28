require "test_helper"

Webdrivers::Chromedriver.required_version = '83.0.4103.14'
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV['SYSTEM_TEST']
    driven_by :selenium, using: ENV['SYSTEM_TEST'].to_sym, screen_size: [1400, 1400]
  else
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end
end
