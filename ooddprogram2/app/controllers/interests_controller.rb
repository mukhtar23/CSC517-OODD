class InterestsController < ApplicationController
  before_action :set_interest, only: [:show, :edit, :update, :destroy]

  # GET /interests
  # GET /interests.json
  def index
    @interests = Interest.all
  end

  # GET /interests/1
  # GET /interests/1.json
  def show
  end

  # GET /interests/new
  def new
    @interest = Interest.new
  end

  # GET /interests/1/edit
  def edit
  end

  # POST /interests
  # POST /interests.json
  def create
    @hunter = Hunter.find(params[:hunter_id])
    @house=House.find(params[:house_id])
    @interest = Interest.new(house_id: @house.house_id,hunter_id:@hunter.hunter_id)
    @interest.save
    redirect_to houses_path, notice: 'Interest was successfully created'
    # respond_to do |format|
    #   if @interest.save
    #     format.html { redirect_to @interest, notice: 'Interest was successfully created.' }
    #     format.json { render :show, status: :created, location: @interest }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @interest.errors, status: :unprocessable_entity }
    #   end
    # end
  end
  def createfromhunter
    @hunter = Hunter.find(params[:hunter_id])
    @house=House.find(params[:house_id])
    new_interest = Interest.find_by(house_id: @house.id, hunter_id: @hunter.id)
    if new_interest.nil?
      @interest = Interest.new(house_id: @house.id, hunter_id: @hunter.id)
      @interest.save
      redirect_to viewhouses_hunter_path(@hunter), notice: 'Interest was successfully created'
    else
      redirect_to viewhouses_hunter_path(@hunter),notice: "Already in the interest list"
    end
    end

  # PATCH/PUT /interests/1
  # PATCH/PUT /interests/1.json
  def update
    respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to @interest, notice: 'Interest was successfully updated.' }
        format.json { render :show, status: :ok, location: @interest }
      else
        format.html { render :edit }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interests/1
  # DELETE /interests/1.json
  def destroy
    @interest.destroy
    respond_to do |format|
      format.html { redirect_to interests_url, notice: 'Interest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      @interest = Interest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:hunter_id, :house_id)

    end
end
