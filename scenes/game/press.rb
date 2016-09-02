class Press < Sprite
	def initialize(x,y,type)
		@dy = 2
		@dx = 4
		@type = type
		@height = 300
		image = Image.load("images/press.png")
		image.set_color_key(C_WHITE)
		self.alpha = 230
		super(x,y,image) #call sprite initialize
	end

	def update
		if @type == 1
			#上半分の上下
			self.y += @dy #taiyaki
			@dy = -@dy if y > -100 || y < -200
		elsif @type == 2
			# 下半分の上下
			self.y -= @dy
			@dy = -@dy if y  > 500 || y < 400
		end
		self.x -= @dx
	end
end