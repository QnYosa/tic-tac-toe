require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/app/game.rb'
require_relative 'lib/app/player.rb'
require_relative 'lib/app/board.rb'
require_relative 'lib/app/boardcase.rb'

require_relative 'lib/view/application.rb'
require_relative 'lib/view/show.rb'

def perform 
    Application.new

end 

perform
