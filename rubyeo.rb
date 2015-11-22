def randomChromosome(length)
  chromosome = []

  length.times do |i|
    chromosome[i] = [true, false].sample
  end

  return chromosome
end

def computeFitness(chromosome)
  return chromosome.count(true)
end

def mutate(chromosome)
  mutationPoint = rand(chromosome.length)

  mutated = chromosome.dup

  mutated[mutationPoint] = ! mutated[mutationPoint]

  return mutated
end

def mutatePopulation(pool)
  mutated = []

  pool.each do |chromosome|
    mutated << mutate(chromosome)
  end

  return mutated

end

def crossover(chromosome, another)
  len = chromosome.length
  xoverPoint = 1 + rand(len - 2)
  tmp = len - xoverPoint - 2
  interval = 1
  if tmp != 0
    interval += rand(len - xoverPoint - 2)
  end

  new_chrom   = chromosome[0..xoverPoint-1]
  new_another = another[0..xoverPoint-1]

  new_chrom.concat(another[xoverPoint..xoverPoint+interval])
  new_another.concat(chromosome[xoverPoint..xoverPoint+interval])

  new_chrom.concat(chromosome[xoverPoint+interval+1..len])
  new_another.concat(another[xoverPoint+interval+1..len])

  return new_chrom, new_another

end
