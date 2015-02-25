# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.development?
    Rails.logger = Le.new('4c8df9cc-02c8-43ba-b5f0-2dee1a81acd9', debug: true)
else
    Rails.logger = Le.new('4c8df9cc-02c8-43ba-b5f0-2dee1a81acd9')
end

logger.info("Info message")
logger.warn("Warn message")
logger.debug("Debug message")

