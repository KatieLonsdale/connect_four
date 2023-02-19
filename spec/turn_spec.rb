# require 'spec_helper'

# describe Turn do
#   before(:each) do
#     @turn = Turn.new('A', 'B')
#     @turn_2 = Turn.new('C', 'E')
#     @turn_3 = Turn.new('D', 'G')
#     # creating several instances for more thorough testing
#   end

#   describe '#initialize' do
#     xit 'exists' do
#       expect(@turn).to be_a Turn
#     end

#     xit 'has a player selection' do
#       expect(@turn.player_selection).to eq('A')
#       expect(@turn_2.player_selection).to eq('C')
#       expect(@turn_3.player_selection).to eq('D')
#     end

#     xit 'has a computer selection' do
#       expect(@turn.computer_selection).to eq('B')
#       expect(@turn_2.computer_selection).to eq('E')
#       expect(@turn_3.computer_selection).to eq('G')
#     end

#     # may potentially add current_board attribute if we need it
#   end

# end