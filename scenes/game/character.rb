 require_relative 'scroll'

class Character < Sprite
  attr_reader :item_count
  def initialize(x, y, image_file)
    @move_flag = true
    @image = Image.load(image_file)
    @image.set_color_key([255, 255, 255])
    @vy = 1.5
    @ay = 1
    super(x,y,@image)
    @game_over = false
    @item_count = 0
  end

  #始め（説明）
  def move_st
  end

  #落下
  def move_loop
    if @move_flag == true
      return if @game_over
      @vy += @ay if @vy < 8
      # TODO: 天井に入り込まないようにする

      if self.y + @image.height > Window.height
        Game::Director.instance.game_over
        @game_over = true
      else
        self.y += @vy
      end
      if self.y <= 0
        @vy = 5
      end
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
    #@ay = 0
    Game::Director.instance.game_over
    @game_over = true
  end

  def get_item(item)
    @item_count += 1
    p @item_count
  end

  def move_stop
    @move_flag = false
  end
  def move_start
    @move_flag = true
  end

end
