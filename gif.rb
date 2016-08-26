class Gif
	attr_accessor :flag
	def initialize
		@flag = false
		@char1 = Image.load("images/char.png")
		@char1.set_color_key([255, 255, 255])
		@char2 = Image.load("images/player.png")
		@char2.set_color_key([255, 255, 255])
		@char3 = Image.load("images/char.png")
		@char3.set_color_key([255, 255, 255])
		@timer = 15 * 2
	end

	def draw
	  if flag
        self.jump
	  else
	    Window.draw(1,0,@char1)
      end
	end

	def jump
		@timer -= 1
		if @timer <= 15 * 1
		  self.jump2
		 
		  if @timer <= 0
		    @timer = 15 * 2
            @flag = false
          end
        else
          Window.draw(1,0,@char2)
		end
	end

	def jump2
		Window.draw(1,0,@char3)
	end
end