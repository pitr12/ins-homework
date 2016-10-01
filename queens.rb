## N-queens problem
## created by Peter Dubec on 30.09.2016
##
## solution representation for N queens:
##  - Array of size N (index = row, vaule = col)
##
## Constraints:
## - only 1 queen in 1 row (solved by representation)
## - only 1 queen in each col (array values must be unique)
## - only one queen on diagonal (for all values val+index and val-index must be unique)
#
# run by ruby ./queens.rb

class Queens

  def self.init(size)
    result = []
    (0..size-1).each do |val|
      result << Array.new(1, val)
    end
    result
  end

  def self.generate_solutions_for_depth(depth, solutions, size)
    new_solutions = []
    solutions.each do |solution|
      (0..size-1).each do |val|
        solution[depth] = val
        if is_correct?(solution, depth + 1)
          new_solutions << solution.clone
        end
      end
    end
    new_solutions
  end

  # [2,0,3,1]

  def self.is_correct? (solution, size)
    return false if size != solution.uniq.size
    sum_values = []
    reduce_values = []
    solution.each_with_index do |val, index|
      sum_values << val + index
      reduce_values << val - index
    end
    size != sum_values.uniq.size || size != reduce_values.uniq.size ? false : true
  end
end

# get user input (size of required solution) and check if user input is number
size = nil
until size.is_a? (Fixnum) do
  puts "Please enter required size (number):\n"
  begin
    size = Integer(gets.chomp)
  rescue ArgumentError
    size = nil
  end
end

# generate initial solution
puts "Computing solutions...\n"
solutions = Queens.init(size)

(1..size-1).each do |depth|
  solutions = Queens.generate_solutions_for_depth(depth, solutions, size)
end

puts solutions.size