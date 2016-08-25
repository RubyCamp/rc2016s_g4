#require_relative '../game/character'
module Game_over
	class Director
		#attr_reader :item_count
    	def initialize
    		#@char = Character.new
    		@game_over = Image.load("images/game_over.jpg")
    	end

    	def play
			Window.draw(0,0,@game_over)
			Window.drawFont(200,100,"YOUR SCORE : "+$item_count.to_s,Font.new(50),{:color => [0,0,0]})
			#p @item_count
		end
	end
end
