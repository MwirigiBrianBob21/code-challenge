class User < ActiveRecord::Base
        #     User#reviews
        # returns a collection of all the Reviews that the User has given
        # User#products
        # returns a collection of all the Products that the User has reviewed
        has_many :reviews
        has_many :products, through: :reviews

#         User#favorite_product
# returns the product instance that has the highest star rating from this user

    def favorite_product
        Product.find(
            Review.find_by(star_rating: reviews.maximum(:star_rating)).product_id
            )
    end
# User#remove_reviews(product)
# takes a Product (an instance of the Product class) and removes all of this user's reviews for that product
# you will have to delete any rows from the reviews table associated with this user and the product
    def remove_reviews(product)
        reviews.where(product_id: product.id).destroy_all
    end
end