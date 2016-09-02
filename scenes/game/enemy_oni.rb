class Enemy_oni < Sprite
	def initialize(x,y)
		@dx = 2
		image = Image.load("images/ogre.png")
		image.set_color_key([0,0,0])
		super(x,y,image)
	end

	def update
		self.x -= @dx
	end

	def hit
		self.vanish
	end
end