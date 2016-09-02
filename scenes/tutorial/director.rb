require_relative 'character'
module Tutorial
	class Director
		def initialize
			@char = Chara.new(400, 300)
			@tu_img = Image.load("images/tutorial.png")
			@tu_img.set_color_key(C_BLACK)
			@X = 480
			@Y = 300
			@f = Font.new(34)
			@text = "Push Space"
			@alp = 255
		end

		def play
			@sw = @char.sw

			if @sw == 0
			@alp = 255
			elsif @sw == 1
			@alp = 100
			end

			$scroll.move
			$scroll.draw
			Window.drawFont(@X,@Y,@text,@f,{:alpha => @alp})
			Window.draw(200,390,@tu_img)

			@char.update
			@char.draw
		
			if Input.keyPush?(K_SPACE) then
				$char_y_start = @char.y
				Scene.set_current_scene(:game)
			end
		end
	end
end
