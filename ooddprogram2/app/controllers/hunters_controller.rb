class HuntersController < ApplicationController
  before_action :set_hunter, only: [:show, :edit, :update, :destroy]

  # GET /hunters
  # GET /hunters.json
  def verify?(hunter)
    unless logged_in_hunter?(hunter) || logged_in_admin?
      log_out
      redirect_to root_path
      return false
    end
    return true
  end

  def index
    if logged_in_admin?
    @hunters = Hunter.all
    else
      log_out
      redirect_to root_path
    end
  end

  # GET /hunters/1/home
  def home
    #Prachi - new RESTful action, home page for each realtor
    @hunter = Hunter.find(params[:id])
    current_user.role = 3
    current_user.save
    return unless verify?(@hunter)
  end

  #get/hunter/1/viewhouse
  def viewhouses
    @hunter=Hunter.find(params[:id])
    return unless verify?(@hunter)
    @houses = House.all
  end
  #get/hunter/1/viewcompany
  def viewcompany
    @hunter=Hunter.find(params[:id])
    return unless verify?(@hunter)
    @companies = Company.all

  end
  #GET/hunter/1/viewinterest
  def viewinterest
    @hunter=Hunter.find(params[:id])
    return unless verify?(@hunter)
    @interests = Interest.all.select do |interest|
      interest.hunter_id == @hunter.id
    end
  end

  # GET /hunter/1/showhousepic/:house_id
  def showhousepic
    params.inspect
    @hunter = Hunter.find(params[:id])
    return unless verify?(@hunter)
    @house = House.find(params[:house_id])

  end


  #GET/hunter/1/viewinquiry
  def viewinquiry
    @hunter=Hunter.find(params[:id])
    return unless verify?(@hunter)
    @inquiries = Inquiry.all.select do |inquiry|
      inquiry.hunter_id == @hunter.id
    end
  end

  # GET /hunters/1
  # GET /hunters/1.json
  def show
    @hunter = Hunter.find(params[:id])
    return unless verify?(@hunter)
  end

  # GET /hunters/new
  def new
    @hunter = Hunter.new
  end

  # GET /hunters/1/edit
  def edit
    @hunter = Hunter.find(params[:id])
    return unless verify?(@hunter)
  end

  # POST /hunters
  # POST /hunters.json
  def create
    @hunter = Hunter.new(hunter_params)
    

    respond_to do |format|
      if @hunter.save
        format.html { redirect_to @hunter, notice: 'Hunter was successfully created.' }
        format.json { render :show, status: :created, location: @hunter }
      else
        format.html { render :new }
        format.json { render json: @hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hunters/1
  # PATCH/PUT /hunters/1.json
  def update
    params.inspect
    real_tmp=Hunter.find(params[:id])
    return unless verify?(real_tmp)
    if real_tmp.nil?
      flash[:notice] = 'Hunter being edited does not exist.'
    end
    real_tmp.user.name = params[:name]
    real_tmp.user.email = params[:email]
    real_tmp.user.phone = params[:phone]
    if params[:set_pw] == '1'
      real_tmp.user.password = params[:password]
    end
    real_tmp.save
    real_tmp.user.save

    flash[:notice] = 'Hunter was successfully updated.'
    redirect_to real_tmp
  end

  # DELETE /hunters/1
  # DELETE /hunters/1.json
  def destroy
    @hunter.destroy
    respond_to do |format|
      format.html { redirect_to home_hunter_path, notice: 'Hunter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hunter
      @hunter = Hunter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hunter_params
      params.require(:hunter).permit(:user_id)
    end
end
