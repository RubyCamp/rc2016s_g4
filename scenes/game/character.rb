class Character < Sprite
    attr_reader :item_count, :game_over
    def initialize(x, y)
        @image = Image.load("images/char.png")
        @image.set_color_key([0, 0, 0])
        @vy = -15
        @ay = 1
        super(x,y,@image)
        @game_over = false
        @item_count = 0
        @hit_bgm = Sound.new("musics/out.wav")
        @get_bgm = Sound.new("musics/jewelry.wav")
    end

    #インデント処理
    def update
        @vy += @ay if @vy < 10 #落下 早すぎたら止める
        if Input.keyPush?(K_SPACE)
            @vy = -15 #ジャンプ
        end
        self.y += @vy

        if self.y < 0 #天井超えない
            self.y = 0
            @vy = 3
        end
        
        if self.y + @image.height > Window.height
            @game_over = true # 落下死
        end
    end

    #ぶつかったか判定
    def hit(obj)
        @hit_bgm.play
        @game_over = true
    end

    #アイテムゲット判定
    def shot(item)
        @get_bgm.play
        @item_count += 1
    end
end