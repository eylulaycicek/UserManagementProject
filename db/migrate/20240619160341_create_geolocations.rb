class CreateGeolocations < ActiveRecord::Migration[7.1]
  def change
    create_table :geolocations do |t|
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
