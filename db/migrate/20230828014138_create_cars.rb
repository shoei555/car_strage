class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.integer    :maker_id,       null:false
      t.string     :maker_maker,    null:false
      t.date       :model_year,     null:false
      t.integer    :mileage,        null:false
      t.integer    :prefecture_id,  null:false
      t.float      :price,          null:false
      t.string     :car_code,       null:false, unique:true
      t.references :user,           null:false, foreign_key:true
      t.date       :car_inspection, null:false
      t.integer    :displacement,   null:false
      t.integer    :color_id,       null:false
      t.integer    :wheeldrive_id,  null:false
      t.integer    :fuel_id,        null:false
      t.references :editer
      t.integer    :tag_id
      t.timestamps
      
    end
  end
end


