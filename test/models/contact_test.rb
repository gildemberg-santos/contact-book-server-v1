require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "Validade nome do contato" do
    contato = Contact.new(name: "Gildemberg Santos Gomes", cpf: "058.577.663-62", email: "gildemberg.santo@gmail.com", dateOfBirth: "1993-05-11")
    assert contato.present?
  end
end
