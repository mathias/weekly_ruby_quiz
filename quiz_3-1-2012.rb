# Getty Ruby Quiz
# Week after: March 1st, 2012
#
# Problem:
# The input contains the sequence of gestures we are going to play in the following rounds. For each gesture, output a line containing the name of the gesture you are going to play against it.
# To solve the easy subproblem, your task is to win every round of the game.
# To solve the hard subproblem, your task is the same. But you have to do it without using the same gesture twice in a row.
# For instance, suppose that in round 1 we played Spock and you played paper. If we play rock in round 2, you can only win by playing Spock, you may not play paper again. In round 3, you then cannot play Spock, but you may play paper again, if you wish.
# Input specification
# The first line contains a positive integer r: the number of rounds we will play.
# Each of the next r lines contains one of the five strings rock, paper, scissors, lizard, and Spock.

require 'rubygems'
require 'pry'


input_file = ['3', "scissors", "scissors", "rock", "lizard", "scissors", "rock", "lizard", "rock", "paper", "lizard"]

rounds = input_file.shift.to_i

all_moves = ['scissors', 'paper', 'rock', 'lizard', 'Spock']
moves_remaining = all_moves.dup

input_file.each do |round|
  choices = case round
            when 'paper'
              ['scissors', 'lizard']
            when 'rock'
              ['paper', 'Spock']
            when 'lizard'
              ['scissors', 'rock']
            when 'scissors'
              ['Spock', 'rock']
            when 'Spock'
              ['paper', 'lizard']
            end
  play = (moves_remaining & choices).first
  moves_remaining = all_moves.dup - [play]
  puts play
end
