require 'singleton'
require_relative 'needle'
require_relative 'scroll'
require_relative 'press'
require_relative 'item'
require_relative 'character'

module Game 
  class Director
    include Singleton
    attr_reader :scroll
    def initialize
      @char = Character.new(400, 300, "images/char.png")
      @bg_img = Image.load("images/background.png")
      @game_over = false
    
      @lwalls = []
      8.times.each do |i|
        y = 500
        y += Needle::HEIGHT / 2 if i.odd? #add 奇数の時ｙに足す. ::NeedleクラスのＨＥＩＧＨＴの変数を用いる
        @lwalls << Needle.new(Needle::WIDTH * i, y) #繰り返したい処理 <<lwallsnにどんどんクラスを入れていくときに用いる
        #@testsp = Sprite.new(400, 200, Image.load("../images/char.png"))
      end

      @upwalls =[]
      8.times.each do |i|
        y = -50
        y += Needle::HEIGHT / 2 if i.odd? #add 奇数の時ｙに足す. ::NeedleクラスのＨＥＩＧＨＴの変数を用いる
        needle = Needle.new(Needle::WIDTH * i, y)
        needle.reverse!
        @upwalls <<  needle#繰り返したい処理 <<lwallsnにどんどんクラスを入れていくときに用いる
      end

      @next_upwalls = Press.new(800,-200)
      @next_upwalls.type = 1

      @next_dowalls = Press.new(800,500)
      @next_dowalls.type = 2

      @third_walls = Press.new(800 * 2,-200,500)
      @third_walls.type = 3

      @items = []
      100.times.each do
        @items << Item.new(rand(800 * 3) + 450, rand(200) + (200))
      end

      @scroll = Scroll.new
      @scroll.move_start
    end

    def play
      @scroll.draw

      if Input.keyPush?(K_RETURN)
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

          @next_dowalls.move_stop
          @next_upwalls.move_stop

          @third_walls.move_stop

          @char.move_stop
          
        # else
        #   @scroll.move_start
        #   8.times.each do |i|
        #     @upwalls[i].move_start
        #   end
        #   8.times.each do |i|
        #     @lwalls[i].move_start
        #   end
        #   10.times.each do |i|
        #     @items[i].move_start
        #   end
        #   @next_dowalls.move_start
        #   @next_upwalls.move_start

        #   @third_walls.move_start
        #   @char.move_start
        end
      end

      #if Input.keyPush?(K_BACK) && scroll.move_flag == false
        #@@current_scene_name = nil
        #Scene.set_current_scene(:title)
      #end

      if Input.keyPush?(K_SPACE) && scroll.move_flag == false && @game_over == false
        @scroll.move_start
        8.times.each do |i|
          @upwalls[i].move_start
        end
        8.times.each do |i|
          @lwalls[i].move_start
        end
        10.times.each do |i|
          @items[i].move_start
        end
        @next_dowalls.move_start
        @next_upwalls.move_start

        @third_walls.move_start
        @char.move_start
      end        


      @char.move_loop
      @char.draw
      @char.move_key
      @char.draw

      unless game_over?
        Sprite.update(@lwalls)
        Sprite.update(@upwalls)
        Sprite.update(@next_dowalls)
        Sprite.update(@next_upwalls)
        Sprite.update(@third_walls)
        Sprite.update(@items)
      end

      Sprite.draw(@items)
      Sprite.draw(@lwalls)
      Sprite.draw(@upwalls)
      Sprite.draw(@next_dowalls)
      Sprite.draw(@next_upwalls)
      Sprite.draw(@third_walls)

      Sprite.check([@lwalls, @upwalls, @next_upwalls, @next_dowalls, @third_walls], @char)
      Sprite.check(@char, @items, :get_item)
      Sprite.clean(@char)

      Window.drawFont(10,10, @char.item_count.to_s ,Font.new(60))
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
