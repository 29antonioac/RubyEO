#!/usr/bin/ruby

require './rubyeo.rb'
require 'benchmark'

def timeXOver(number, individual, another)
  t = Benchmark.realtime {
    number.times do |i|
      one, two = crossover(individual, another)
    end
  }
  return t
end

length = 16
iterations  = 10000
top = 32768

while length <= top
  individual = randomChromosome(length)
  another = randomChromosome(length)
  puts "Ruby-Xover, " + length.to_s + ", " + timeXOver(iterations, individual, another).to_s
  length *= 2
end
