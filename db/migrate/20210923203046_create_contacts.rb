class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :dateOfBirth
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
