class Scroll
	attr_reader :move_flag
	def initialize
		@move_flag = false
		@img1 = Image.load("images/background.png")
		@img2 = Image.load("images/background.png")
		@dx = 5		
		@x1 = 0
		@x2 = @img1.width
	end

	def draw
		Window.draw(@x1,0,@img1)
		Window.draw(@x2,0,@img2)
		move if @move_flag == true
	end

	def move
		@x1 -= @dx
		@x2 -= @dx
		@x1 =  @img1.width if @x1 <= -@img1.width
		@x2 =  @img2.width if @x2 <= -@img2.width
	end

	def move_stop
		@move_flag = false
	end
	def move_start
		@move_flag = true
	end
	
end