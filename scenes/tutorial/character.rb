module Tutorial
	class Character < Sprite
		attr_accessor :sw		#追加
		def initialize(x, y, image_file)
			@x, @y = x, y
			@image = Image.load(image_file)
    		@image.set_color_key([0, 0, 0])
    		#@dy = 10
    		@vy = 1
    		@ay = 1
				@sw = 0					#追加
    		super(x,y,image_file)
		end

		def update
			#TODO:要微調整
			@vy += @ay if @vy < 2
    		@y += @vy

			@vy = -12 if @y > (self.y + 50) - @image.height || @y < (self.y - 50) 
				
			if @y >= self.y + 10			#追加
				@sw = 0					#追加
			else 							#追加
				@sw = 1					#追加
			end								#追加
		end

		def draw
    		Window.draw(@x, @y, @image)
  		end
	end
end