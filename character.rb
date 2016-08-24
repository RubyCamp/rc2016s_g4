class Character
  def initialize(x, y, image_file)
    @x, @y = x, y
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
    @vy = 2
    @ay = 1
  end

  def move_loop
    #if Window.height <= @y then
      #地面に落ちた時の判定
      #@y = Window.height
      #@down = 0
      #@y -= 10
     # return
   # else
      #落下
      @vy += @ay if @vy < 10
      @y += @vy
    #end

  end

  def move_key
    if Input.keyPush?(K_SPACE) then
      @vy = -15 if @y > (Window.height - @image.height) || @y > 0
    end
  end

  def draw
    Window.draw(@x, @y, @image)
  end

  #def out
  #  if @y == Window.height then
      #Window.draw_font(0, 0, "hit!", font)
  #    puts "test"
  #    @y = Window.height

  #  end
  #end

end
