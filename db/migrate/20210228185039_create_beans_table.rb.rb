class CreateBeansTable < ActiveRecord::Migration[5.2]
  def change
    create_table :beans do |t|
      t.string :name
      t.string :brand
      t.integer :grind_size
      t.decimal :dose
      t.decimal :extraction_volume
      t.decimal :extraction_time
    end
  end
end
