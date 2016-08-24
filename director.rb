class Director
  def initialize
    @char = Character.new(400, 300, "images/char.png")
    @bg_img = Image.load("images/background.png")
  end

  def play
    Window.draw(0, 0, @bg_img)
    @char.move_loop
    @char.draw
    @char.move_key
    @char.draw
    #@char.out

  end
end
