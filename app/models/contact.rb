class Contact < ApplicationRecord
  validates :name, :cpf, :email, :dateOfBirth, presence: true
  validates :cpf, uniqueness: true
end
