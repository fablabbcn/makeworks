require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include CapybaraSelect2
  Capybara.configure do |config|
    config.ignore_hidden_elements = false
  end

  if ENV['SYSTEM_TEST']
    driven_by :selenium, using: ENV['SYSTEM_TEST'].to_sym, screen_size: [1400, 1400]
  else
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end
end
