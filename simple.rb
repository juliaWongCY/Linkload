#!/usr/bin/ruby
# simple.rb

# A simple example of a ruby script
puts "Running the ruby script #{$0}"
#read in input
name = ARGV[0]   
#find the current path
dir = `pwd`  
puts "hello #{name} you are at the path #{dir}"


