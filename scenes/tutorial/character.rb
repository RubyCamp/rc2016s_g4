module Tutorial
	class Character < Sprite
		def initialize(x, y, image_file)
			@x, @y = x, y
			@image = Image.load(image_file)
    		@image.set_color_key([0, 0, 0])
    		#@dy = 10
    		@vy = 1
    		@ay = 1
    		super(x,y,image_file)
		end

		def update
			#TODO:要微調整
			@vy += @ay if @vy < 2
    		@y += @vy

    		@vy = -12 if @y > (self.y + 50) - @image.height || @y < (self.y - 50) 

		end

		def draw
    		Window.draw(@x, @y, @image)
  		end
	end
end