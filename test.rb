require_relative "rubyeo"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_simple
    population = []
    chromosome_length =  16
    population_size =  32

    population_size.times do |i|
        puts i
        population << randomChromosome(chromosome_length)
        assert_not_nil(population[i].length, "length is none")
        assert_equal(population[i].length, chromosome_length, "lengh are not equal")
        mutated = mutate(population[i])
        assert_equal(population[i].length, mutated.length,"mutate and original length are not equal")
        assert_not_equal(population[i], mutated, "mutated and population[i] are equal")
      end

  end

end
