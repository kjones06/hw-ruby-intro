# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  @current_sum = 0
  
  arr.each do |x|
    @current_sum = @current_sum + x
  end
  
  return @current_sum
end

def max_2_sum arr
  @sorted_arr = []
  @large_sum = 0
  
  @sorted_arr = arr.sort
  
  if @sorted_arr.length > 1
    @large_sum = @sorted_arr[arr.length - 1] + @sorted_arr[arr.length - 2]
  elsif @sorted_arr.length == 1
    @large_sum = @sorted_arr[0]
  else 
    @large_sum = 0
  end
  
  return @large_sum
end

def sum_to_n? arr, n
  if arr.length < 2
    return false
  end
  
  arr.each do |x|
    arr.each do |y|
      if (x + y == n) && (x != y)
        return true
      end
    end
  end
  
  return false
end

# Part 2

def hello(name)
  return 'Hello, ' + name
end

def starts_with_consonant? s
  @unacceptable_chars = ['A', 'a', 'E', 'e', 'I', 'i', 'O', 'o', 'U', 'u']
  
  @unacceptable_chars.each do |u|
    if s[0] == u
      return false
    end 
  end 
  
  if !(/[[:alpha:]]/ === s[0]) || (s[0] == "")
    return false
  end
  
  return true
end

def binary_multiple_of_4? s
  @integer_value = 0
  @binary_length = s.length
  
  if @binary_length == 0
    return false
  end
  
  for i in 0..(@binary_length - 1) do
    if (s[i].to_i != 0) && (s[i].to_i != 1)
      return false
    elsif !(/[[:digit:]]/ === s[i])
      return false
    end
  end
  
  for j in 0..(@binary_length - 1) do
    @integer_value = @integer_value + ((s[j].to_i)*2)**(@binary_length - 1)
    @binary_length = @binary_length - 1
  end
  
  if s[s.length - 1].to_i == 0
    @integer_value = @integer_value - 1 
  end
  
  if @integer_value % 4 == 0
    return true
  else
    return false
  end
end

# Part 3

class BookInStock
  
  
  def initialize a, b
    if (a == '') || (b <= 0)
      raise ArgumentError
    end
    
    @isbn = a
    @price = b
  end
  
  def price
    return @price
  end
  
  def price=(p)
    @price = p
    return @price
  end

  def isbn 
    return @isbn
  end
  
  def isbn=(i)
    @isbn = i
    return @isbn
  end
  
  def price_as_string 
    @string_price = "#{@price}"
    
    for i in 0..(@string_price.length - 1)
      if @string_price[i] == "."
        if ((/[[:digit:]]/ === @string_price[i+1]) && (i + 2 != @string_price.length))
          return "$#{@price}"
        else
          return "$#{@price}0"
        end 
      end
    end

    return "$#{@price}.00"
  end

end
