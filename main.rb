require 'dxruby'

require_relative'scene'
require_relative'scenes/load_scenes'

Window.caption = "Ruby"
Window.width = 800
Window.height = 600

bgm = Sound.new("musics/bgm.mid")

bgm.play

Scene.set_current_scene(:title)

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  Scene.play_scene
end
