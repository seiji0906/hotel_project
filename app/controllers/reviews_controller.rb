class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @reviews = @hotel.reviews
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.new
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:notice] = "口コミが投稿されました！"
      redirect_to hotel_reviews_path(@hotel)
    end
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.find(params[:id])
  end

  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.find(params[:id])
    @review = @review.update(review_params)
    redirect_to hotel_review_path
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])   
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to hotel_reviews_path(@hotel)
    end
  end

  def review_params
    params.require(:review).permit(:name,:rating,:title,:body,:hotel_id,:user_id)
  end
end
