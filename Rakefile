require 'rake'
require 'rspec/core/rake_task'

# frozen_string_literal: true

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation'
end
task default: :spec
