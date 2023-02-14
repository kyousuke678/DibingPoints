class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :name
      t.text :body
      t.float :rate
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :customer_id

      t.timestamps
    end
  end
end
