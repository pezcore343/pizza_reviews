class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, 				null: false
      t.text :body, 					null: false
      t.integer :rating, 			null: false
      t.integer :pizzeria_id, null: false
      t.integer :user_id, 		null: false

      t.timestamps
    end

    add_index :reviews, :pizzeria_id
    add_index :reviews, :user_id
  end
end
