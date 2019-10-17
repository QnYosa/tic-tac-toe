
class Application
	attr_accessor :players, :board_complete, :game

	def initialize
		welcome_message()
		@players = create_players()
		@game = Game.new(@players).complete_game
	end

	def welcome_message
		puts "|--Bienvenue dans le jeu--|"
	end

	def create_players 								#fonction pour créer ces deux joueurs
		players = []
		puts "Joueur 1 - quel est ton nom"
		print "> "
		name_1 = gets.chomp
		puts "quel est ton symbole x or o"
		print "> "
		sym_1 = gets.chomp
		until sym_1 == "x" || sym_1 == "o"
			puts "essaye encore x ou o!"
			print "> "
			sym_1 = gets.chomp
		end
		players.push(Player.new(name_1,sym_1))
		puts "Joueur 2 - quel est ton nom"
		print "> "
		name_2 = gets.chomp
		while name_2 == name_1
			puts "ne prend pas le même nom ! oh !"
			print "> "
			name_2 = gets.chomp
		end
		if sym_1 == "x" then sym_2 = "o" else sym_2 = "x" end
		players.push(Player.new(name_2,sym_2))
		puts "et tu auras le symbole #{sym_2}"
		#print players
		#puts ""
		return players
	end

end