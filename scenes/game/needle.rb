class Needle < Sprite
	HEIGHT = 200
	WIDTH = 100

	def initialize(x,y)
		x1 = WIDTH/2
		y1 = 0
		x2 = 0
		y2 = HEIGHT
		x3 = WIDTH
		y3 = HEIGHT
		@dx = 4
		image = Image.load("images/needle.png")
		image.set_color_key(C_WHITE)
		super(x,y,image) #(0,400)からの相対距離を用いて判定
		self.collision = [x1,y1,x2,y2,x3,y3]
	end

	def reverse!
		self.angle = 180
	end

	def update
		self.x -= @dx
	end
end
