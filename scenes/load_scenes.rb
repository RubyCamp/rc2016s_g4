require_relative 'title/director'
require_relative 'title/scene1'
require_relative 'game/director'
#require_relative 'game/character/character'

#director = Director.instance

Scene.add_scene(Title::Director.new,  :title)
Scene.add_scene(Scene1::Ready.new,  :scene1)
Scene.add_scene(Game::Director.instance, :game)
