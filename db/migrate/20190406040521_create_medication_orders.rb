class CreateMedicationOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :medication_orders do |t|
      t.string :name
      t.decimal :dosage
      t.text :necessity
      t.integer :unit, default: '0'
      t.integer :route
      t.integer :patient_id
    end
  end
end
