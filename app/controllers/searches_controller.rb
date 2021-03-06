class SearchesController < ApplicationController

  def index
    @search_results = []
    @restaurants = Restaurant.all
    @restaurants.each do |restaurant|

      if params[:city] && restaurant.city == params[:city]
        @search_results << restaurant
      elsif params[:city]== nil && (restaurant.remain_seat_search(params[:date], params[:res_time]) >= params[:party_size].to_i)
        @search_results << restaurant
      end
    end
    @search_results
  end

end
