class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    # Split the string into words, process each word, then join back with spaces
    str.split(' ').map do |word|
      # Extract any punctuation at the end of the word
      punctuation = word.match(/[[:punct:]]+$/)&.[](0) || ''
      # Remove punctuation for processing
      clean_word = word.gsub(/[[:punct:]]+$/, '')
      
      # Process the word and add back punctuation
      if clean_word.length > 4
        # Check if the first letter is uppercase
        (clean_word[0] == clean_word[0].upcase ? 'Marklar' : 'marklar') + punctuation
      else
        word  # Original word already has punctuation
      end
    end.join(' ')
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    return 0 if nth <= 2  # First two terms are 1, 1 (no even numbers)
    
    # Initialize first two Fibonacci numbers
    fib1, fib2 = 1, 1
    even_sum = 0
    
    # Generate Fibonacci numbers up to nth term
    (3..nth).each do |_|
      # Calculate next Fibonacci number
      current = fib1 + fib2
      
      # Add to sum if even
      even_sum += current if current.even?
      
      # Update previous numbers
      fib1 = fib2
      fib2 = current
    end
    
    even_sum
  end

end
