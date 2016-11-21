class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    flash[:notice] = "Success!"
    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
    @review.destroy
    redirect_to '/restaurants'
  end


private
  def review_params
    params.require(:review).permit(:review, :rating, :user_id, :restaurant_id)
  end
end