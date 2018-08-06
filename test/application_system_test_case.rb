require "test_helper"
require "capybara/poltergeist"

Capybara.server = :webrick

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :poltergeist, screen_size: [1400, 1400], options: { js_errors: false }
end
