# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Galavasana::Application.initialize!

Harsh.enable_haml

YAML::ENGINE.yamler = 'syck'
