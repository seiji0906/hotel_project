class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
    @hotels = Hotel.all
    @q = Hotel.ransack(params[:q])
    @hotels = @q.result(distinct: true)
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    @hotels = @prefecture.hotels
    @q = @hotels.ransack(params[:q])
    @hotels = @q.result(distinct: true)
    @rank_hotels = @hotels.sort_by {|hotel| hotel.reviews.average(:rating)&.round(1)}.reverse.first(2)
  end

  def prefecture
  	@prefecture = Prefecture.find(params[:id])
  	
  	
  end
end



