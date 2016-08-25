require_relative 'character'
require_relative '../game/scroll'
module Tutorial
	class Director
    	def initialize
    		@char = Character.new(400, 300, "images/char.png")
    		@bg_img = Image.load("images/background.png")
    		@scroll = Scroll.new
    		@scroll.move_start
  		end

  		def play
    		Window.draw(0,0,@bg_img)
    		@scroll.draw 
			@char.update
			@char.draw
			if Input.keyPush?(K_SPACE) then
				Scene.set_current_scene(:game)
				
  			end
  		end
	end
end
