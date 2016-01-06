desc 'Run Cane quality checks'
require 'cane'
require 'cane/rake_task'
Cane::RakeTask.new(:cane) do |cane|
  cane.abc_max       = 15
  cane.no_doc        = true
  cane.style_glob    = './{app,lib}/**/*.rb'
  cane.style_measure = 120

  cane.abc_exclude   = []
end

desc 'Run RuboCop, stay out of trouble.'
require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb']
  # only show the files with failures
  task.formatters = ['files']
  # don't abort rake on failure
  task.fail_on_error = false
end

task :quality do
  Rake::Task["cane"].invoke
  Rake::Task["rubocop"].invoke
end
