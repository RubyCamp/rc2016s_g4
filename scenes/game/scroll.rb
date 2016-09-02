class Scroll
	def initialize
		@img1 = Image.load("images/background.png")
		@img2 = Image.load("images/background.png")
		@dx = 2		
		@x1 = 0
		@x2 = @img1.width
	end

	def draw
		Window.draw(@x1,0,@img1)
		Window.draw(@x2,0,@img2)
	end

	def move
		@dx += 0.03 if @dx < 6 && Scene.current_scene != :title
		@x1 -= @dx
		@x2 -= @dx
		@x1 =  @x2 + @img2.width if @x1 <= -@img1.width
		@x2 =  @x1 + @img1.width if @x2 <= -@img2.width
	end
end