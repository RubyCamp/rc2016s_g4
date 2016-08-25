class Enemy_karasu < Sprite
	def initialize(x,y)
		@move_flag = true
		@dx = 5
		image = Image.load("images/karasu1.png")
		image.set_color_key([255,255,255])
		super(x,y,image)
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
