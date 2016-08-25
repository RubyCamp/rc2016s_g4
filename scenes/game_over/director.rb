module Game_over
	class Director
    	def initialize
    		@game_over = Image.load("images/game_over.jpg")
    	end

    	def play
			Window.draw(0,0,@game_over)
		end
	end
end
