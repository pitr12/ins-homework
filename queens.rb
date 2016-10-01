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
      index = -1
      arr = Array.new(size) do |x|
        index += 1
        index == 0 ? x = val : x = -1
      end
      result << arr
    end
    result
  end

  def self.generate_solutions_for_depth(depth, solutions)
    new_solutions = []
    input_size = solutions[0].size - 1
    solutions.each do |solution|
      (0..input_size).each do |val|
        index = -1
        new_sol = solution.map do |x|
          index += 1
          index == depth ? val : x
        end
        new_solutions << new_sol if is_correct?(new_sol)
      end
    end

    new_solutions
  end

  def self.is_correct? (solution)
    tmp_sol = solution.map {|x| x}
    tmp_sol.delete(-1)
    size = tmp_sol.size
    return false if size != tmp_sol.uniq.size
    sum_values = []
    reduce_values = []
    tmp_sol.each_with_index do |val, index|
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

# generate initial solution (Array of inserted size filled with -1 values)
puts "Computing solutions...\n"
solutions = Queens.init(size)

(1..size-1).each do |depth|
  solutions = Queens.generate_solutions_for_depth(depth, solutions)
end

puts solutions.size

