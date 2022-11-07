class CreateReviews < ActiveRecord::Migration[6.1]
  def change
#     The reviews table should also have:
# A star_rating column that stores an integer.
# A comment column that stores a string.
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :star_rating
      t.integer :product_id
      t.string :comment
    end
  end
end
