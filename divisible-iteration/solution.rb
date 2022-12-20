=begin
Write a ruby function that prints the numbers from 1 to 100.
But for multiples of three, it prints 'Ping' instead of the number and for the multiples of five, it prints 'Pong'.
For numbers that are multiples of both three and five print 'PingPong'.
=end

def ping_pong
  for i in 1..100
    if i % 3 == 0 && i % 5 == 0
      puts "PingPong"
    elsif i % 3 == 0
      puts "Ping"
    elsif i % 5 == 0
      puts "Pong"
    else
      puts i
    end
  end
end
