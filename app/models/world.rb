class World < ActiveRecord::Base
	has_many :lifeforms
	has_many :vegetations

	def tick
		temperature_sway
		grow_vegetation

		# TODO: scope to current world here
		lifeforms.where(died_at: nil).each do |lifeform|
			lifeform.tick
		end

		log_records_for_today
	end

	def add_lifeform
		life = Lifeform.create! name: 'Bob', owner: 'dru'

		@messages << "Lifeform '#{life['name']} of #{life['owner']}land has entered the world. New population: #{lifeforms.count}"
	end

	def messages
		@messages ||= []
	end

	private

	def grow_vegetation
		vegetations.each do |tree|
			update_attribute :amount, amount + rand(temperature / 10)
		end
	end

	def temperature_sway
		if temperature < 40
			update_attribute :temperature, temperature + rand(10) + Math.log(lifeforms.count)
		end

		if temperature > 60
			update_attribute :temperature, temperature - rand(10) + Math.log(lifeforms.count)
		end
	end

	def log_records_for_today
		yield # Respond with @messages over irc
	end
end
