# problem 1

require 'digest'

i = 1

secret_key = 'ckczppom'

while true
  s = "#{secret_key}#{i}"

  digest = Digest::MD5.hexdigest(s)

  break if digest.start_with?('00000')

  i += 1
end

puts i

# problem 2

while true
  s = "#{secret_key}#{i}"

  digest = Digest::MD5.hexdigest(s)

  break if digest.start_with?('000000')

  i += 1
end

puts i
