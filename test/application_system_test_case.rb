require "test_helper"

# System tests are failing locally with this error:
# Webdrivers::NetworkError: Net::HTTPServerException: 404 "Not Found" with
# https://chromedriver.storage.googleapis.com/LATEST_RELEASE_84.0.4115

# Adding this 'hack' meanwhile
if ENV['CUSTOM_CHROME_VERSION']
  Webdrivers::Chromedriver.required_version = '83.0.4103.14'
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV['SYSTEM_TEST']
    driven_by :selenium, using: ENV['SYSTEM_TEST'].to_sym, screen_size: [1400, 1400]
  else
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end
end
