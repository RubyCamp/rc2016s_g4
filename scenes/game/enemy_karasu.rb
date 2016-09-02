class Enemy_karasu < Sprite
	def initialize(x,y)
		@dx = 5
		image = Image.load("images/karasu1.png")
		image.set_color_key([255,255,255])
		super(x,y,image)
	end

	def update
		self.x -= @dx
	end

	def hit
		self.vanish
	end
end