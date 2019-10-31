class SearchesController < ApplicationController
  def new
    @search= Search.new
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  def addinterest
    @hunter = Hunter.find(params[:hunter_id])
    @house=House.find(params[:house_id])
    new_interest = Interest.find_by(house_id: @house.id, hunter_id: @hunter.id)
    if new_interest.nil?
      @interest = Interest.new(house_id: @house.id, hunter_id: @hunter.id)
      @interest.save
      redirect_to new_search_path, notice: 'Interest was successfully created'
    else
      redirect_to new_search_path,notice: "Already in the interest list"
    end
  end


  def search_params
    params.require(:search).permit(:location, :min_price, :max_price, :min_footage, :max_footage)
  end
    end