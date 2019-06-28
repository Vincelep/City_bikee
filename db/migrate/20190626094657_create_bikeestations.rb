# frozen_string_literal: true

class CreateBikeestations < ActiveRecord::Migration[5.2]
  def change
    create_table :bikeestations do |t|
      t.string :station_id
      t.integer :empty_slots
      t.integer :free_bikes
      t.float :latitude
      t.float :longitude
      t.string :name
      t.timestamps
    end
  end
end
