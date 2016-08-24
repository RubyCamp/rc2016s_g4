require 'dxruby'

require_relative 'scroll'

Window.caption = 'puts "hello, Shimane!!"'

Window.width	= 800
Window.height	= 600

scroll = Scroll.new

Window.loop do
	break if Input.keyPush?(K_ESCAPE)

	scroll.draw 
	scroll.move if !Input.keyDown?(K_A)
end
