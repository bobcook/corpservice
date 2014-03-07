task :console do
  require 'irb'
  require 'irb/completion'
  require 'corpservice' # You know what to do.
  ARGV.clear
  IRB.start
end