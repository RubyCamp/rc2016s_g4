class Item < Sprite
	def initialize(x,y,image)
		@dx = 4
		super(x,y,image)
	end

	def hit
		vanish
	end

	def update
		self.x -= @dx
	end
end