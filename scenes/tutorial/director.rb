require_relative 'character'
require_relative '../game/scroll'
module Tutorial
  class Director
    def initialize
      @char = Character.new(400, 300, "images/char.png")
      @bg_img = Image.load("images/background.png")
      @scroll = Scroll.new
      @scroll.move_start
      @X = 445
      @Y = 300
      @f = Font.new(30)
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

      @char.update
      @char.draw
      if Input.keyPush?(K_SPACE) then
        Scene.set_current_scene(:game)
      
      end
    end
  end
end
