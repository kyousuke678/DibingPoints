class CreatePointComments < ActiveRecord::Migration[6.1]
  def change
    create_table :point_comments do |t|
      t.text :comment
      t.integer :point_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
