class CreateTrackers < ActiveRecord::Migration[5.1]
  def change
    create_table(:trackers) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)

      t.timestamp()
    end
  end
end
