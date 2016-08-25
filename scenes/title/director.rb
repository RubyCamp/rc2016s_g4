module Title
 	class Director
    	def initialize
    		@X = 330
    		@Y = 100
			@SX = 325
			@SY = 500
    		@f = Font.new(32)
			@sf = Font.new(20)
			@alp = 0
			@sw = 0
	    	@bg_img = Image.load("images/background.png")
	    	@title = "タイトル"
	    	@start = "please push space"
	  	end

	  	def play
	    	Window.draw(0,0,@bg_img)
			Window.drawFont(@X,@Y,@title,@f)
			if @sw == 0
				@alp += 3
				if @alp == 255
					@sw = 1
				end
			elsif @sw == 1
				@alp -= 3
				if @alp == 0
					@sw = 0
				end
			end

			Window.drawFont(@SX,@SY,@start,@sf,{:alpha => @alp})

			if Input.keyPush?(K_SPACE) then
				Scene.set_current_scene(:tutorial)
			end
	  	end
	end
end
