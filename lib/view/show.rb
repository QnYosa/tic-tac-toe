
class Show
	attr_accessor :board_t

	def initialize(board) 
		@board_t = board
	end

	def view_board(board)								#créer le visuel du jeu
		for i in [0,3,6]
			if board.show_value(i) == nil
				print "|     |"
			else
				print "|  #{board.show_value(i)}  |"
			end
		end
		puts "\n"
		for i in [1,4,7]
			if board.show_value(i) == nil
				print "|     |"
			else
				print "|  #{board.show_value(i)}  |"
			end
		end
		puts "\n"
		for i in [2,5,8]
			if board.show_value(i) == nil
				print "|     |"
			else
				print "|  #{board.show_value(i)}  |"
			end
		end
		puts "\n"
	end
end