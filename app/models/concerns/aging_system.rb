require 'active_support/concern'

module AgingSystem
  extend ActiveSupport::Concern

  included do
    # Overrideable to re-use hunger system across lifeforms but let them customize usaging
    def aging_system_hooks
      increase_age
      maybe_die_of_aging!
      maybe_proclaim_milestone
      maybe_complain_of_aging
    end

    private

    def increase_age
      update_attribute :age, age + 1
    end

    def maybe_proclaim_milestone
      if (age / 365.0).zero?
        messages << "#{name} turned #{age} year(s) old!"
      end
    end

    def maybe_complain_of_aging
    end

    def maybe_die_of_aging!
      # TODO max age?
    end
  end

  class_methods do
  end
end