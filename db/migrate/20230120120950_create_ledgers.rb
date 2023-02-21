class CreateLedgers < ActiveRecord::Migration[6.1]
  def change
    create_table :ledgers, id: :uuid do |t|
      t.string :name
      t.string :description
      t.json :metadata

      t.timestamps
    end
  end
end
