class Address < ApplicationRecord
  belongs_to :contact
  validates :contact, presence: true
  validates :cep, :road, :number, :district, :city, :states, presence: true
end
