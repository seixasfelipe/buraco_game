require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new 'rspec' do |t|
  t.pattern = 'spec/buraco/*_spec.rb'
  t.rspec_opts = ['--color', '--format doc']
end

task :default => [:rspec]

