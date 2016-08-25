require_relative 'scroll'

class Character < Sprite
  def initialize(x, y, image_file)
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
    @vy = 1.5
    @ay = 1
    super(x,y,@image)
  end

  #始め（説明）
  def move_st
  end

  #落下
  def move_loop
    @vy += @ay if @vy < 10
    self.y += @vy
    # TODO: 天井に入り込まないようにする
    if self.y <= 0
      @vy = -@vy
    end
  end

  #操作
  def move_key
    if Input.keyPush?(K_SPACE) then
      @vy = -15 
    end
  end

  #ぶつかったか判定
  def hit(obj)
    @vy = 0
    @ay = 0
    scroll = Game::Director.instance.scroll
    scroll.move_stop
  end
end
