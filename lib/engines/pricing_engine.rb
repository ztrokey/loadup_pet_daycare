module Engines
  class PricingEngine
    attr_reader :hours_requsted, :animal_type

    BASE_RATE = 20.0

    def initialize(hours_requsted, animal_type)
      @hours_requsted = hours_requsted
      @animal_type = animal_type
    end

    def total
      hours_requsted * calculated_rate
    end

    private

    def calculated_rate
      send("#{animal_type.downcase}_rate")
    end

    def cat_rate
      BASE_RATE + 5.0
    end

    def dog_rate
      BASE_RATE + 10.0
    end
  end
end
