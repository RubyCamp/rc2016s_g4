class Enemy_ufo < Sprite
	def initialize(x,y)
		@dx = 4
		@dy = 1
		@sw = 0
		@swy = y
		image = Image.load("images/ufo1.png")
		image.set_color_key([0,0,0])
		super(x,y,image)
	end

	def update
		self.x -= @dx
		if @sw == 0
			self.y -= @dy
			if self.y == @swy - 50
				@sw = 1
			end
		elsif @sw == 1
			self.y += @dy
			if self.y == @swy + 50
				@sw = 0
			end
		end
	end

	def hit
		self.vanish
	end
end
