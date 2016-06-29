require 'active_support/concern'

module HungerSystem
  extend ActiveSupport::Concern

  included do
    # Overrideable to re-use hunger system across lifeforms but let them customize usaging
    def hunger_system_hooks
      increase_hunger
      maybe_die_of_hunger!
      maybe_complain_of_hunger
    end

    private

    def increase_hunger
      #update_attribute :hunger_score, hunger_score + 1
    end

    def maybe_complain_of_hunger
      if hunger_score > 100 - rand(50)
        messages << "#{name} is hungry!"
      end
    end

    def maybe_die_of_hunger!
      if hunger_score > 100 - rand(15)
        death!
      end
    end
  end

  class_methods do
  end
end