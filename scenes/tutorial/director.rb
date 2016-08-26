require_relative 'character'
require_relative '../game/scroll'
module Tutorial
	class Director
		def initialize
			@char = Character.new(400, 300, "images/char.png")
			@bg_img = Image.load("images/background.png")
			@tu_img = Image.load("images/tutorial.png")
			@tu_img.set_color_key(C_BLACK)
			@scroll = Scroll.new
			@scroll.move_start
			@X = 480
			@Y = 300
			@f = Font.new(34)
			@text = "Push Space"
			@alp = 255
		end

		def play
			@sw = @char.sw
			Window.draw(0,0,@bg_img)
			@scroll.draw

			if @sw == 0
			@alp = 255
			elsif @sw == 1
			@alp = 100
			end

			Window.drawFont(@X,@Y,@text,@f,{:alpha => @alp})
			Window.draw(200,390,@tu_img)

			@char.update
			@char.draw
		
			if Input.keyPush?(K_SPACE) then
				Scene.set_current_scene(:game)
			end
		end
	end
end
