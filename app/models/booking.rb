class Booking < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :animal_name, presence: true
  validates :animal_type, inclusion: { in: %w[Cat Dog] }
  validates_inclusion_of :hours_requested, in: 2..8
  validates :date_of_service, presence: true
  validate :date_of_service_in_future

  before_save :update_total_price

  def date_of_service_in_future
    return unless date_of_service.present? && date_of_service < Date.today

    errors.add(:date_of_service, "can't be in the past")
  end

  private

  def update_total_price
    pricing_engine = Engines::PricingEngine.new(hours_requested, animal_type)
    self.total_price = pricing_engine.total
  end
end
