class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :road
      t.string :number
      t.string :district
      t.string :city
      t.string :states

      t.timestamps
    end
  end
end
