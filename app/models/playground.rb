class Playground
    def self.backwardsPrime(start, stop)
        array = (start..stop).to_a
        primes = array.select do |num|
           (2..(num/2)).to_a.all? do |possible_factor|
             num % possible_factor != 0
           end
         end
        
        primes.select do |num|
          new_number = num.to_s.split('').reverse.join('').to_i
          (2..(new_number/2)).to_a.all? do |possible_factor|
             new_number % possible_factor != 0
           end
        end
    end
end

# Playground.backwardsPrime(7000, 7100)