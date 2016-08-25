require 'singleton'
require_relative 'needle'
require_relative 'scroll'
require_relative 'character'

module Game 
  class Director
    include Singleton
    attr_reader :scroll
    def initialize
      @char = Character.new(400, 300, "images/char.png")
      @bg_img = Image.load("images/background.png")
    
      @lwalls = []
      8.times.each do |i|
        y = 400
        y += Needle::HEIGHT / 2 if i.odd? #add 奇数の時ｙに足す. ::NeedleクラスのＨＥＩＧＨＴの変数を用いる
        @lwalls << Needle.new(Needle::WIDTH * i, y) #繰り返したい処理 <<lwallsnにどんどんクラスを入れていくときに用いる
        #@testsp = Sprite.new(400, 200, Image.load("../images/char.png"))
      end

      @scroll = Scroll.new
      @scroll.move_start
    end

    def play
      @scroll.draw 
      @char.move_loop
      @char.draw
      @char.move_key
      @char.draw
      Sprite.draw(@lwalls)
      Sprite.check(@lwalls, @char)
      Sprite.clean(@char)
    end
  end
end
