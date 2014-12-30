class Pizzeria < ActiveRecord::Base
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  validates_uniqueness_of :street, scope: [:city, :state]
end