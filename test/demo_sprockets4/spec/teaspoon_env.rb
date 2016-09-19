Teaspoon.configure do |config|
  config.suite do |suite|
    suite.use_framework :jasmine, "2.3.4"
    suite.helper = "spec_helper"
    suite.boot_partial = "bundle_boot"
  end
end
