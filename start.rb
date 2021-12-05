#!/usr/bin/env ruby
# frozen_string_literal: true

Dir[File.join(__dir__, 'lib', '*.rb')].sort.each { |file| require file }

if ARGV.count > 1
  puts 'Enter only one filename'
  exit
elsif ARGV.count.zero?
  puts 'Enter a filename'
  exit
else
  Main.new(ARGV[0]).call
end
