class CreateMercuryAreas < ActiveRecord::Migration
  def change
    create_table :mercury_areas do |t|
      t.text :content
      t.string :key
    end
  end
end
