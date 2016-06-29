require 'active_support/concern'

module TemperatureSystem
  extend ActiveSupport::Concern

  included do
    # Overrideable to re-use hunger system across lifeforms but let them customize usaging
    def temperature_system_hooks
      adjust_temperature
      maybe_die_of_temperature!
      maybe_complain_of_temperature
    end

    private

    def adjust_temperature
      if world.temperature > temperature
        update_attribute :temperature, temperature + (temperature * 0.1)
      else
        update_attribute :temperature, temperature - (temperature * 0.1)
      end
    end

    def maybe_complain_of_temperature
      if temperature > 80
        messages << "#{name} is getting very hot!"
      end

      if temperature < 20
        messages << "#{name} is freezing!"
      end
    end

    def maybe_die_of_temperature!
      if temperature > 100 && rand(3).zero?
        death!
      end

      if temperature < 0 && rand(4).zero?
        death!
      end
    end
  end

  class_methods do
  end
end