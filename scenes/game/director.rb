require 'singleton'
require_relative 'needle'
require_relative 'scroll'
require_relative 'press'
require_relative 'item'
require_relative 'character'
require_relative 'enemy_karasu'
require_relative 'enemy_oni'
require_relative 'enemy_ufo'


module Game 
  class Director
    include Singleton
    attr_reader :scroll
    def initialize
      @char = Character.new(400, 300, "images/char.png")
      #@char.set_color_key([0, 0, 0])
      @bg_img = Image.load("images/background.png")
      @ruby_img = Image.load("images/ruby_image.png")

      @game_over = false
    
      @lwalls = []
      @upwalls =[]
      @items = []
      @next_upwalls = []
      @next_dowalls = []
      @third_walls = []

      @enemy_karasus = []
      @enemy_onis = []
      @enemy_ufos = []

      @pos = 0
      @scroll = Scroll.new
      @scroll.move_start
      @stop = false
    end

    def play
      @pos += 4
      if @pos % 2000 == 800
        8.times do |i|
          y = 400
          y += Needle::HEIGHT / 2 if i.odd? #add 奇数の時ｙに足す. ::NeedleクラスのＨＥＩＧＨＴの変数を用いる
          @lwalls << Needle.new(Needle::WIDTH * i + 800 + @pos, y) #繰り返したい処理 <<lwallsnにどんどんクラスを入れていくときに用いる
          #@testsp = Sprite.new(400, 200, Image.load("../images/char.png"))
        end
        8.times do |i|
          y = -100
          y += Needle::HEIGHT / 2 if i.odd? #add 奇数の時ｙに足す. ::NeedleクラスのＨＥＩＧＨＴの変数を用いる
          needle = Needle.new(Needle::WIDTH * i + 800 * 3 + @pos, y)
          needle.reverse!
          @upwalls <<  needle#繰り返したい処理 <<lwallsnにどんどんクラスを入れていくときに用いる
        end

        @next_upwalls << Press.new(800 * 2 + @pos,-200, 1)

        @next_dowalls << Press.new(800 * 4 + @pos,500, 2)

        @third_walls << Press.new(800 * 5 + @pos,-200, 1)
        @third_walls << Press.new(800 * 5 + @pos, 500, 2)

        30.times do |i|
          @items << Item.new(rand((@pos)..(800 * 5 + @pos)), rand(200) + (200))
        end
#########
        10.times.each do
			@enemy_karasus << Enemy_karasu.new(rand(800 * 5) + (800 * 3),rand(300) + 200)
		end

		5.times.each do
			@enemy_onis << Enemy_oni.new(rand(800 * 5) + (800 * 4),rand(300) + 200)
		end

		5.times.each do
			@enemy_ufos << Enemy_ufo.new(rand(800 * 5) + (800 * 4),rand(300) + 200)
		end

      end
      @scroll.draw

      # if Input.keyPush?(K_RETURN)
      #   @stop = true

      #   if @scroll.move_flag == true
      #     @scroll.move_stop
      #   end
      # end

      if Input.keyPush?(K_RETURN)
      	@stop = true
        if @scroll.move_flag == true
          @scroll.move_stop

          8.times.each do |i|
            @upwalls[i].move_stop
          end

          8.times.each do |i|
            @lwalls[i].move_stop
          end

          10.times.each do |i|
            @items[i].move_stop
          end

          10.times.each do |i|
            @enemy_karasus[i].move_stop
          end

		5.times.each do |i|
            @enemy_onis[i].move_stop
          end

		5.times.each do |i|
            @enemy_ufos[i].move_stop
          end


          @next_dowalls.move_stop
          @next_upwalls.move_stop

          @third_walls.move_stop

          @char.move_stop
          
        end
      end

      if Input.keyPush?(K_SPACE) && scroll.move_flag == false && @game_over == false
        @stop = false
        @scroll.move_start
      end        

      unless @stop
        @char.move_loop
        @char.draw
        @char.move_key
        @char.draw
      end
      @char.draw

      unless game_over? || @stop
        Sprite.update(@lwalls)
        Sprite.update(@upwalls)
        Sprite.update(@next_dowalls)
        Sprite.update(@next_upwalls)
        Sprite.update(@third_walls)
        Sprite.update(@items)
      	Sprite.update(@enemy_karasus)
		Sprite.update(@enemy_onis)
		Sprite.update(@enemy_ufos)
      end

      Sprite.draw(@items)
      Sprite.draw(@enemy_karasus)
	Sprite.draw(@enemy_onis)
			Sprite.draw(@enemy_ufos)
      Sprite.draw(@lwalls)
      Sprite.draw(@upwalls)
      Sprite.draw(@next_dowalls)
      Sprite.draw(@next_upwalls)
      Sprite.draw(@third_walls)

      Sprite.check([@lwalls, @upwalls, @next_upwalls, @next_dowalls, @third_walls, @enemy_karasus, @enemy_onis, @enemy_ufos], @char)
      Sprite.check(@char, @items, :get_item)
      Sprite.clean(@char)

      Window.draw(10,10,@ruby_img)
      Window.drawFont(50,10, "×"+ $item_count.to_s,Font.new(40))
    end

    def game_over
      @game_over = true
      @scroll.move_stop
    end

    def game_over?
      return @game_over
    end
  end
end
