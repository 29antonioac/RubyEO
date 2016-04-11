#!/usr/bin/ruby

require './rubyeo.rb'
require 'benchmark'

def timeMaxOnes(number, individual)
  t = Benchmark.realtime {
    number.times do |i|
      fitness = computeFitness(individual)
    end
  }
  return t
end

length = 16
iterations  = 100000
top = 32768

while length <= top
  individual = randomChromosome(length)
  puts "Ruby-BitVector, " + length.to_s + ", " + timeMaxOnes(iterations, individual).to_s
  length *= 2
end
