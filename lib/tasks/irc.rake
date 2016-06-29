namespace :irc do
	desc "Create a world"
	task :play => :environment do
		require 'cinch'

		config = {
			network:  'irc.amazdong.com',
			channel:  '#test',
			nickname: 'gm'
		}

		puts "Use the last world for mad fast dev speed hax"
		world = World.last

		bot = Cinch::Bot.new do
			configure do |c|
				c.server = config[:network]
				c.channels = ['#aw', config[:channel]]
				c.nickname = config[:nickname]
			end

			on :message, /.*/ do |m|
				m.reply "Ticking world forward 1."
				world.tick do
					m.reply world.messages
				end
			end
		end

		bot.start
	end
end