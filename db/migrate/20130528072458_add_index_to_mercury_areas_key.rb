class AddIndexToMercuryAreasKey < ActiveRecord::Migration
  def change
    add_index :mercury_areas, :key
  end
end
