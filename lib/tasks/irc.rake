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
		world = World.last || World.create(name: 'Brave New World')

		bot = Cinch::Bot.new do
			configure do |c|
				c.server = config[:network]
				c.channels = ['#aw', config[:channel]]
				c.nickname = config[:nickname]
			end

			on :message, /play/ do |m|
				world.add_lifeform
			end

			on :message, /.*/ do |m|
				m.reply "The world ticks forward."
				world.tick
				m.reply world.fetch_and_clear_messages
			end


			# FAQ

			on :message, /population/ do |m|
				average_age = world.lifeforms.map(&:age)
				average_age = average_age.reduce(:+) / average_age.length

				highest_age = world.lifeforms.sort_by(&:age).last
				available_berries = world.vegetations.map(&:amount).reduce(:+)

				m.reply [
					"This world currently supports a population of #{world.lifeforms.count},",
					"average age of #{average_age} days,",
					"oldest age of #{highest_age.age} by #{highest_age.name} of #{highest_age.owner}land,",
					"and has #{available_berries} berries available to eat."
				].join ' '
			end

			on :message, /temperature/ do |m|
				m.reply "The current temperature on this world is #{world.temperature}."
			end
		end

		bot.start
	end
end