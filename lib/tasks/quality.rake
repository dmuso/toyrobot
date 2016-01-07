begin
  require 'cane'
  require 'cane/rake_task'
rescue LoadError
  puts 'Cane gem is unavailable'
else
  desc 'Run Cane quality checks'
  Cane::RakeTask.new(:cane) do |cane|
    cane.abc_max       = 15
    cane.no_doc        = true
    cane.style_glob    = './{app}/**/*.rb'
    cane.style_measure = 120

    cane.abc_exclude   = []
  end
end

begin
  require 'rubocop/rake_task'
rescue LoadError
  puts 'RuboCop gem is unavailable'
else
  desc 'Run RuboCop, stay out of trouble.'
  RuboCop::RakeTask.new(:rubocop)
end

task :quality do
  Rake::Task['rubocop'].invoke
  Rake::Task['cane'].invoke
end
