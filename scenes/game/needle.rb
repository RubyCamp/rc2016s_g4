class Needle < Sprite
  HEIGHT = 200
  WIDTH = 100

  def initialize(x,y)
    x1 = WIDTH/2
    y1 = 0
    x2 = 0
    y2 = HEIGHT
    x3 = WIDTH
    y3 = HEIGHT
    image = Image.new(WIDTH,HEIGHT)
    image.triangle_fill(x1,y1,x2,y2,x3,y3,[255,0,0])
    super(x,y,image) #(0,400)からの相対距離を用いて判定
    self.collision = [x1,y1,x2,y2,x3,y3]
  end
end
