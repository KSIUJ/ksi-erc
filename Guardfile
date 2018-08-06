guard :minitest, spring: "rails test" do
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^test/test_helper\.rb$})      { 'test' }
  watch(%r{^app/models/(.+)\.rb})        { |m| "test/models/test_#{m[1]}.rb" }
  watch(%r{^app/controllers/(.+)_controller.rb}) { |m| "test/system/test_#{m[1]}.rb" }
end
