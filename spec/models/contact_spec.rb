require 'spec_helper'

RSpec.describe Contact do
  context 'Validade nome do contato' do
    it "ele esta valido" do
      contato = Contact.new(name: "Gildemberg Santos Gomes", cpf: "058.577.663-62", email: "gildemberg.santo@gmail.com", dateOfBirth: "1993-05-11")
    end

    it "ele não esta valido" do
    end
  end
end
