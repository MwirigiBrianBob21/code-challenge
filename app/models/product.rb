class Product < ActiveRecord::Base
#     Product#reviews
# returns a collection of all the Reviews for the Product
# Product#users
# returns a collection of all the Users who reviewed the Product
    has_many :reviews
    has_many :users, through: :reviews

#     Product#leave_review(user, star_rating, comment)
# takes a User (an instance of the User class), a star_rating (integer), and a comment (string) 
# as arguments, and creates a new Review in the database associated with this Product and the User

    def leave_review(user, star_rating, comment)
        Review.create(product: self, user: user, star_rating: star_rating, comment: comment)
    end
# Product#print_all_reviews
# should puts to the terminal a string representing each review for this product
# each review should be formatted as follows: Review for {insert product name} by
#  {insert user name}: {insert review star_rating}. {insert review comment}

    def print_all_reviews
        self.reviews.each do |review|
            puts "Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
        end
        nil
    end
# Product#average_rating
# returns a float representing the average star rating for all reviews for this product

    def average_rating
        self.review.average(:star_rating).to_f
    end

end
