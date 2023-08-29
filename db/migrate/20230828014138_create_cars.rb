class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string     :name,          null:false
      t.integer    :maker_id,      null:false
      t.date       :model_year,    null:false
      t.integer    :mileage,       null:false
      t.integer    :prefecture_id, null:false
      t.integer    :price,         null:false
      t.string     :car_code,      null:false, unique:true
      t.references :user,          null:false, foreign_key:true
      t.timestamps
    end
  end
end
