class CreatePointTags < ActiveRecord::Migration[6.1]
  def change
    create_table :point_tags do |t|
      t.integer :point_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
