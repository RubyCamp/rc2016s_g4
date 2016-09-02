require 'singleton'
require_relative 'needle'
require_relative 'press'
require_relative 'item'
require_relative 'character'
require_relative 'enemy_karasu'
require_relative 'enemy_oni'
require_relative 'enemy_ufo'

module Game 
	class Director
	    include Singleton
	    attr_reader :char
	    def initialize
			@ruby_img = Image.load("images/ruby_image.png")
			@items = []
			@walls = []
			@enemys = []
			@stop = false
			@flg = true
	    end

	    def play
			if @flg #一度だけ
				@char = Character.new(400, $char_y_start)
				@flg = false
			end
			
			obj_new

			if Input.keyPush?(K_RETURN)
				@stop = true
			end
			if @stop == true && Input.keyPush?(K_SPACE)
				@stop = false
			end
			unless @stop
				Sprite.update([@char, @walls, @enemys, @items])
				Sprite.check((@walls + @enemys), @char)
				Sprite.check(@char, @items)
				Sprite.check(@walls, (@items + @enemys))
				obj_vanish
				Sprite.clean(@walls)
				Sprite.clean(@enemys)
				Sprite.clean(@items)
				$scroll.move
			end
			$scroll.draw
			Sprite.draw([@char, @walls, @items, @enemys])
			Window.draw(10,10,@ruby_img)
			Window.drawFont(50,10, "×"+ @char.item_count.to_s,Font.new(40))
			if @char.game_over
				Scene.set_current_scene(:game_over)
			end
		end

		private
		def wall_new
			x = 800
			begin
				a = rand(4)
			end while a == @prev_wall
			@prev_wall = a
			case a
				when 0 #下三角
					8.times do |i|
						y = 400
						y += Needle::HEIGHT / 2 if i.odd? #奇数の時 生成場所のy座標を下へ
						@walls << Needle.new(x + i * 100, y)
					end
				when 1 # 上三角
					8.times do |i|
						y = -100
						y += Needle::HEIGHT / 2 if i.odd? #奇数の時 生成場所のｙ座標を下へ
						needle = Needle.new(x + i * 100, y)
						needle.reverse!
						@walls <<  needle
					end
				when 2 # 上四角
					y = -200
					type = 1
					@walls << Press.new(x, y, type)
				when 3 # 下四角
					y = 500
					type = 2
					@walls << Press.new(x, y, type)
				end
		end

		def enemys_new
			karasus = (1..2)
			oni = (1..2)
			ufo = (1..2)
			x = (800..1600)
			y = (50..550)

			karasus = rand(karasus)
			karasus.times do
				@enemys << Enemy_karasu.new(rand(x),rand(y))
			end

			oni = rand(oni)
			oni.times do
				@enemys << Enemy_oni.new(rand(x),rand(y))
			end

			ufo = rand(ufo)
			ufo.times do
				@enemys << Enemy_ufo.new(rand(x),rand(y))
			end
		end
		def obj_vanish
			(@walls + @enemys + @items).each do |obj|
				if obj.x + obj.image.width < 0
					obj.vanish
				end
			end
    	end

		def obj_new
			flg = true
			@walls.each do |wall|
				if wall.x + wall.image.width <= 800
					flg = true
				else
					flg = false
				end
			end
			wall_new if flg
			while @items.length <= 10 do
				@items << Item.new(rand(800..1600), rand(600 - @ruby_img.height), @ruby_img)
			end

			enemys_new if flg#@enemys.length < 5
		end
	end
end