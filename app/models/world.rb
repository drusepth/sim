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

		#yield
		log_records_for_today
	end

	def add_lifeform
		life = lifeforms.create!(
			name: 'Bob',
			owner: 'dru',
			created_at: DateTime.now,
			age: 0
		)

		messages << "'#{life['name']}' of #{life['owner'].capitalize}land has entered the world! New population: #{lifeforms.count}."
	end

	def messages
		@messages ||= []
	end

	def fetch_and_clear_messages
		res = messages.to_sentence
		@messages.clear

		res
	end

	private

	def grow_vegetation
		vegetations.each do |tree|
			update_attribute :amount, amount + rand(temperature / 10)
		end
	end

	def temperature_sway
		new_temperature  = temperature + rand(10) - 10

		if temperature < 40
			new_temperature += rand(10) + Math.log(lifeforms.count)
		end

		if temperature > 60
			new_temperature -= rand(10) + Math.log(lifeforms.count)
		end

		update_attribute :temperature, new_temperature
	end

	def log_records_for_today
	end
end
