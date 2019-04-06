class CreateOrderFrequencies < ActiveRecord::Migration[5.1]
  def change
    create_table :order_frequencies do |t|
      t.string :value
      t.integer :unit, default: '0'
      t.integer :medication_order_id
    end
  end
end
