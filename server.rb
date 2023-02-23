require './spec/spec_helper'

server = TCPServer.new(9292) # Create a new instance of TCPServer on Port 9292
connection = server.accept

connect_four = ConnectFour.new(server)
connect_four.start(connection)
user_choice = connect_four.play_or_quit(connection)

connect_four.play(connection) if user_choice == 'p'

puts 'now I am here in the program'
connection.close
