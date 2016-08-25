 require_relative 'scroll'

class Character < Sprite
  attr_reader :item_count
  def initialize(x, y, image_file)
    @move_flag = true
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
    @vy = 1.5
    @ay = 1
    super(x,y,@image)
    @game_over = false
    $item_count = 0
    @hit_bgm = Sound.new("musics/out.wav")
    @get_bgm = Sound.new("musics/jewelry.wav")
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
        Scene.set_current_scene(:game_over)
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
    @hit_bgm.play
    @vy = 0
    Game::Director.instance.game_over
    @game_over = true
    Scene.set_current_scene(:game_over)
  end

  def get_item(item)
    @get_bgm.play
    $item_count += 1
    p $item_count
  end

  def move_stop
    @move_flag = false
  end
  def move_start
    @move_flag = true
  end

end
