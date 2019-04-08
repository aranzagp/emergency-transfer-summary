class AddFacilityIdToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :facility_id, :integer
  end
end
