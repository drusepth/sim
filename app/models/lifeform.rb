class Lifeform < ActiveRecord::Base
	belongs_to :parent
	belongs_to :world

  delegate :score, to: :age

  include HungerSystem
  include TemperatureSystem
  include AgingSystem

	def tick
    # 3 ways to die:
    # 1. Hunger (decrease hunger by 1 each day)
    # 2. Temperature (lower than 20 or higher than 120)
    # 3. Damage (health depletes to zero)
    hunger_system_hooks
    temperature_system_hooks
    aging_system_hooks
  end

  def messages
    @messages ||= []
  end

  private

  def temperature_system_hooks
  end

  def aging_system_hooks
  end

  def death!
    update_addribute! :died_at, DateTime.now
  end

end
