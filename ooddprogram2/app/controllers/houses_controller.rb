class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
# @company = Company.all
    if logged_in_admin?
      @company = Company.find_by(id: current_user.realtor.company_id)
    else
      @company = Company.find_by(id: current_user.company_id)
    end
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    #below three lines infer the company_id from realtor_id
    tem_params = house_params
    realtor = Realtor.find(house_params[:realtor_id].to_i)
    tem_params[:company_id] = realtor.company_id
    @house = House.new(tem_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:location, :square_ft, :year_built, :style, :price, :floor, :basement, :owner, :contact_info, :realtor_id, :company_id, :pic_link)
    end
end
