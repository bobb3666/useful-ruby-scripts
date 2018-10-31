# Ruby Sieve of Eratoosthenes

class IsPrime
  def sieve(max)
    # Set up an array with all the numbers between 0 and max
    primes = (0..max).to_a

    #Set both the first and second positions (0 and 1) to nil
    # as they aren't prime
    primes[0] = primes[1] = nil

    # Iterate through primes array
    primes.each do |p|
      #skip if nul
      next unless p

      # Break if we are past the square root of max value
      break if p*p > max 

      #Start at the square of the current number, and step through
      # GO up to the max value, by multiples of the current number
      # and replace that value with nil in the primes array
      (p*p).step(max, p) { |m| primes[m] = nil }
    end

    # Finally return the compactedarray
    primes.compact
  end

  def prime?(num)
    sieve(num).include?(num)
  end

end