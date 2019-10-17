

class Board
	attr_accessor :board_complete
	


	def initialize
		@board_complete = board_complete_nil
		@turn_count = 0
	end

	def board_complete_nil
		board_complete = []
		for letter in "a".."c"
			for number in "1".."3"
				board_complete << BoardCase.new([letter,number])
			end
		end
		return board_complete
	end

	def find_my_position(position)
		@board_complete.each do |boardcase|
			if boardcase.position == position
				return boardcase
			end
		end
	end

	def tick_case(boardcase, player_symbole)			#fonction pour noter x ou o dans la case jouée
		boardcase.value = player_symbole
		puts "vous avez tické la case #{boardcase.position.join()} avec #{boardcase.value}"
		@turn_count += 1 #pour compter les tours
	end

	def is_still_going?									#le nombre de coup max sinon match nul
		@turn_count < 9 
	end

	def is_finished(player_symbole)						#correspond aux 8 possibilités pour gagner
		(@board_complete[0].value == player_symbole && @board_complete[1].value == player_symbole && @board_complete[2].value == player_symbole) ||
			(@board_complete[3].value == player_symbole && @board_complete[4].value == player_symbole &&@board_complete[5].value == player_symbole) ||
			(@board_complete[6].value == player_symbole && @board_complete[7].value == player_symbole &&@board_complete[8].value == player_symbole) ||
			(@board_complete[0].value == player_symbole && @board_complete[3].value == player_symbole && @board_complete[6].value == player_symbole) ||
			(@board_complete[1].value == player_symbole && @board_complete[4].value == player_symbole &&@board_complete[7].value == player_symbole) ||
			(@board_complete[2].value == player_symbole && @board_complete[5].value == player_symbole &&@board_complete[8].value == player_symbole) ||
			(@board_complete[0].value == player_symbole && @board_complete[4].value == player_symbole &&@board_complete[8].value == player_symbole)	||
			(@board_complete[2].value == player_symbole && @board_complete[4].value == player_symbole &&@board_complete[6].value == player_symbole) 
	end

	def show_value(number)
		return @board_complete[number].value
	end
end