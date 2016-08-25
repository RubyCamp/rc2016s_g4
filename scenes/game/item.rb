class Item < Sprite
	def initialize(x,y)
		@move_flag = true
		@dx = 4
		image = Image.load("images/ruby_image.png")
		image.set_color_key(C_BLACK)#定数と変数は”いらない
		super(x,y,image)
	end

	def hit(object)
		vanish
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