class Chara < Sprite
	attr_accessor :sw
	def initialize(x, y)
		@image = Image.load("images/char.png")
		@image.set_color_key([0, 0, 0])
		@vy = -1.5
		@ay = 1
		@sw = 0
		super(x,y,@image)
	end
	#移動処置
	def update
		@vy += @ay if @vy < 10 #落下 早すぎたら止める
		if self.y > 300
			@vy = -15
			@sw = 0
		else
			@sw = 1	#ジャンプ
		end
		self.y += @vy
	end
end
