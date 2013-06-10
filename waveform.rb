require 'socket'

connection = TCPSocket.open 'localhost', '4000'

# set variables (from arguments or default)
waveform, num_partials = ARGV
waveform ||= 'saw'
num_partials ||= 10

# Set equation for partials, relative to i
case waveform
  when 'square'
    equation = "i % 2 == 1 ? 1/i : 0"
  when 'triangle'
    equation = "i % 2 == 1 ? (1/(i**2) * (i % 4 == 1 ? 1 : -1)) : 0"
  when 'saw'
    equation = "1/i"
  else
    equation = waveform
end

# Generate partials

partials = []
num_partials.to_i.times do |i|
  i = i.to_f+1.0
  partials << eval(equation)
end 

# present the partials in a nice way for puredata
partials = partials.join(' ')

puts partials

# throw the partials down to sinesum in the pd patch
connection.puts "sinesum 32768 #{partials};"
connection.puts 'normalize 1;'
