class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @review = Review.new
    @key = ENV['GOOGLE_API_KEY']
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @restaurant.update(restaurant_params)
     redirect_to restaurants_path
    else
     render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.destroy
    flash[:notice] = "Successfully deleted #{@restaurant.name}"
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Not your restaurant!"
  ensure
    redirect_to '/restaurants'
  end

private
  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :address, :city, :state, :zip_code, :user_id)
  end
end