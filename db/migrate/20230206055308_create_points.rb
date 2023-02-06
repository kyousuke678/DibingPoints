class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :name
      t.text :body
      t.string :address
      t.integer :customer_id
      t.float :rate

      t.timestamps
    end
  end
end
