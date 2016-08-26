class Needle < Sprite
	HEIGHT = 200
	WIDTH = 100

	def initialize(x,y)
		@move_flag = true
		x1 = WIDTH/2
		y1 = 0
		x2 = 0
		y2 = HEIGHT
		x3 = WIDTH
		y3 = HEIGHT
		@dx = 4
		image = Image.new(WIDTH,HEIGHT)
		image.triangle_fill(x1,y1,x2,y2,x3,y3,[100,100,100])
		super(x,y,image) #(0,400)からの相対距離を用いて判定
		self.collision = [x1,y1,x2,y2,x3,y3]
	end

	def reverse!
		self.angle = 180
	end

	def update
		self.x -= @dx if @move_flag == true
	end

	def move_stop
		@move_flag = false
	end

	def move_start
		@move_flag = true
	end
end
