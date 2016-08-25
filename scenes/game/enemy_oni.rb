class Enemy_oni < Sprite
	def initialize(x,y)
		@move_flag = true
		@dx = 2
		image = Image.load("images/ogre.png")
		image.set_color_key([0,0,0])
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
