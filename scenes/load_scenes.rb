require_relative 'title/director'
require_relative 'tutorial/director'
require_relative 'game/director'
#require_relative 'game/character/character'

#director = Director.instance

Scene.add_scene(Title::Director.new,  :title)
Scene.add_scene(Tutorial::Director.new,  :tutorial)
Scene.add_scene(Game::Director.instance, :game)
