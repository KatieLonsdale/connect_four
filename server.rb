require './spec/spec_helper'
require 'socket'  # Library that contains TCPServer
require 'cgi'

server = TCPServer.new(9292) # Create a new instance of TCPServer on Port 9292
connection = server.accept


# form = "<html>I am a form!</html>"
# status = "http/1.1 200 ok"
# response = "\r\n" + form
# connection.puts response


connect_four = ConnectFour.new
connect_four.start(connection)
user_choice = connect_four.play_or_quit(connection)

puts 'now I am here in the program'
connect_four.play if user_choice == 'p'

connection.close
