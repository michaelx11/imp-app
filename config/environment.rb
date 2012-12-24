# Load the rails application require File.expand_path('../application', __FILE__)

# Initialize the rails application
ImpApp::Application.initialize!

Date::DATE_FORMATS.merge!(default: "%m/%d/%Y")
Time::DATE_FORMATS.merge!(default: "%I:%M %p")
