require 'pry'

class SecretHandshake
  CODE = { 1 =>'wink', 10 => 'double blink', 100 =>
         'close your eyes', 1000 => 'jump' }

  def initialize(number)
    @number = number.to_i
  end

  def commands
    return [] if @number.to_i.zero?
    secret_code = []
    key = @number.to_s(2).to_i
    # binding.pry
    return [CODE[key]] if @number <= 8 && (@number % 2).zero?
    @key = key.digits.reverse
    iterator = 1
      @key.each do |value|
      # binding.pry
      secret_code << CODE[iterator] if value == 1 && iterator != 10000
      iterator *= 10
     end
    iterator == 10000? secret_code : key_reverse(@key)
  end

  def key_reverse(array)
    bucket = []
    iterator =  1
    @key.reverse.each do |value|
      bucket << CODE[iterator] if value == 1 &&
      iterator != 10000
      iterator *= 10
    end
    @number ==3 ? bucket : bucket.reverse
  end


end

p case1 = SecretHandshake.new(3)
p case1.commands
