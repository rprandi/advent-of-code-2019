def computer(input)
  initial_position = 0

  while(1)
    commands = input.values_at(initial_position, initial_position+1, initial_position+2, initial_position+3)
    break if commands[0] == 99

    case commands[0]
    when 1
      input[commands[3]] = input[commands[1]] + input[commands[2]]
    when 2
      input[commands[3]] = input[commands[1]] * input[commands[2]]
    when 99
      break
    end

    initial_position += 4
  end
  #input.each_with_index { |data, index| p "input[#{index}] = #{data}" }

  #p "---- Position 0 = " + input[0].to_s
   input
end


def main
  (0..99).each do |noun|
    (0..99).each do |verb|
      input = File.read('part1.txt').split(',')
      input.map!(&:to_i)
      input[1] = noun
      input[2] = verb
      input = computer(input)
      if input[0] == 19690720
        p 'noun ' + noun.to_s
        p 'verb ' + verb.to_s
      end
    end
  end
end

main

