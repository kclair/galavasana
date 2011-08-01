require "resque/tasks"

# loads the rails env when the workers start
task 'resque:setup' => :environment


