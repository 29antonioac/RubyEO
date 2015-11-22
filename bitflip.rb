#!/usr/bin/ruby

require './rubyeo.rb'
require 'benchmark'

def timeMutations(number, individual)
  t = Benchmark.realtime {
    number.times do |i|
      mutated = mutate(individual)
    end
  }
  return t
end

length = 16
iterations  = 100000
top = 32768

while length <= top
  individual = randomChromosome(length)
  puts "Ruby-BitString, " + length.to_s + ", " + timeMutations(iterations, individual).to_s
  length *= 2
end
