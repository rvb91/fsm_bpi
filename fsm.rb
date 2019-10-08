#!/usr/bin/ruby

def fsm_definition
  {
    S0: {
      initial: true,
      final: true,
      output_val: 0,
      transitions: {
      "0": :S0,
      "1": :S1,
      }
    },
    S1: {
      initial: false, 
      final: true,
      output_val: 1,
      transitions: {
      "0": :S2,
      "1": :S0,
      }
    },
    S2: {
      initial: false, 
      final: true,
      output_val: 2,
      transitions: {
      "0": :S1,
      "1": :S2
      }
    },
  }
end

def calculator(input_string)
  initial = nil
  fsm_definition.each do |name, hash|
    if hash[:initial]
      initial = name
      break
    end
  end

  initial || (raise StandardError, "Inital state not defined")

  current = initial
  stream = input_string.chars
  
  while(char = stream.shift)
    current = fsm(current, char)
  end
  final = current

  if fsm_definition[final][:final]
    fsm_definition[final][:output_val]
  else
    raise StandardError, "invalid input"
  end
end

def fsm(current_state, char)
  states = fsm_definition
  if states[current_state]
    if states[current_state][:transitions][char.to_sym]
      next_state = states[current_state][:transitions][char.to_sym]
    else
      raise StandardError, "Invalid Input"
    end
  else
    raise StandardError, "State not implemented"
  end
  next_state
end
