
class Game
	@@game_count = 0
	attr_accessor :players, :board_complete, :show_t

	def initialize(array_of_players)
		@players = array_of_players
		@board_complete = Board.new 
		@show_t = Show.new(@board_complete)
	end
	#prevoir qui commence pour qu'a chaque jeux ca s'alterne

	def new_turn(place_players)
			puts "#{players[place_players].name} à toi de jouer. Donne moi une position"
			print "> "
			choice_position = gets.chomp.chars									#demande à l'utilisateur de rentrer une combinaison
			while (choice_position[0] != "a" && choice_position[0] != "b" && choice_position[0] != "c") || 
					(choice_position[1] != "1" && choice_position[1] != "2" && choice_position[1] != "3") #verifie que vous respectez le format et d'etre dans tableau
				print "dans le board ça serait plus pratique (ex: a2) > "
				choice_position = gets.chomp.chars
			end
			the_boardcase_to_tick = @board_complete.find_my_position(choice_position) 
			while the_boardcase_to_tick.is_empty? == false 								#verifie que la case n'est pas déjà remplie 
				print "essaye encore, elle est déjà remplie > "
				choice_position = gets.chomp.chars
				while (choice_position[0] != "a" && choice_position[0] != "b" && choice_position[0] != "c") || 
					(choice_position[1] != "1" && choice_position[1] != "2" && choice_position[1] != "3")
					print "dans le board ça serait plus pratique (ex: a2) > "
					choice_position = gets.chomp.chars
				end
				the_boardcase_to_tick = @board_complete.find_my_position(choice_position)
				puts the_boardcase_to_tick
			end
			@board_complete.tick_case(the_boardcase_to_tick, players[place_players].symbole) #fonction pour noter la case de x ou o en fct du joueur

			if @board_complete.is_finished(players[place_players].symbole) == true      #regarde si parmi une des 8combinaises une est bonne
				puts "Bravo #{players[place_players].name}, tu as gagné !!"
			end
			@show_t.view_board(@board_complete)											#lance le morpion visuel
			puts "\n"
	end

	def complete_game
		@board_complete = Board.new 												
		if @@game_count.even?															#permet d'alterner entre les joueurs
			i = 0
			j = 1
		else
			i = 1
			j = 0
		end
		while @board_complete.is_still_going? 											
			new_turn(i)
			if @board_complete.is_finished(players[i].symbole) == true then break end	#casse la boucle si le 1er joueur a gagné
			if @board_complete.is_still_going?											#s'il y a toutes les cases prises (soit 9coups deja fait) alrs match nul
				new_turn(j) 
			else 
				puts "Pa pa paaaa... Match nul"
			end
			if @board_complete.is_finished(players[j].symbole) == true then break end	#casse la boucle si le 2nd joueur a gagné
		end
		@@game_count += 1 																#pour compter les jeux
		menu()
		perform()
	end

	def self.count
		return @@game_count
	end

	def menu
		puts "-"*18
		puts "Vous avez fait #{@@game_count} partie(s)"
		puts "Que voulez vous faire?"
		puts "a - refaire une partie"
		puts "-"*18
	end

	def perform
		print "> "
		choice_follow = gets.chomp
		while choice_follow != "a"
			puts "Oups, je n'ai pas compris votre demande"
			print "> "
			choice_follow = gets.chomp
		end
		if choice_follow == "a"
			new_game = Game.new(@players).complete_game
		else
			puts "Merci et à bientot pour de futures aventures"
		end
    end
end 
