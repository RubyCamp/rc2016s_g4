module Scene1
	class Ready
			TIME = 3
		def initialize
			@sw = 0
			@X = 330
			@Y = 280
			@f = Font.new(60)
			@cf = Font.new(30)
			@ready = "Ready…"
			@start = "Start!!"
			@count = TIME
			@time = @count
		end
	  
		def play
      @ready_time ||= Time.now
			
			if @time >= 1
				@count = (TIME - (Time.now - @ready_time).to_i).to_s
				#@time = TIME - (Time.now - @ready_time).to_i
				Window.drawFont(@X,@Y,@ready,@f)
				Window.drawFont(@X + 60,@Y + 60,@count,@cf)
			elsif @time < 1
				Window.drawFont(@X,@Y,@start,@f)
				Window.drawFont(@X + 60,@Y + 60,@count,@cf)
				if @time < 0
					Scene.set_current_scene(:game)
				end
			end

			@time = TIME - (Time.now - @ready_time).to_i
		end
	end
end
