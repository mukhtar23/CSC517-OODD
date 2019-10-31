class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /inquiries
  # GET /inquiries.json
  def index
    @inquiries = Inquiry.all
  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
  end

  # GET /inquiries/new
  def new
  @inquiry=Inquiry.new
    session[:house_id] = params[:house_id]
    session[:hunter_id] = params[:hunter_id]
  end


  # GET /inquiries/1/edit
  def edit
  end

  def addinquiry
    @hunter=Hunter.find(params[:id])
  end

  # put /inquiries/add_from_hunter/hunter_id/house_id
  def addfromhunter
    @hunter=Hunter.find(params[:hunter_id])
    @house=House.find(params[:house_id])
    @inquiry = Inquiry.new(house_id: @house.id, hunter_id: @hunter.id)
    @inquiry.subject = params[:subject]
    @inquiry.message = params[:message]
    if @inquiry.save
      format.html { redirect_to hunter_house_path, notice: 'Inquiry was successfully created.' }
      format.json { render :show, status: :created, location: @inquiry }
    else
      format.html { render :new }
      format.json { render json: @inquiry.errors, status: :unprocessable_entity }
    end
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @hunter=Hunter.find(session[:hunter_id])
    #val = inquiry_params
    #val[:house_id] = session[:house_id]
    #val[:hunter_id]=current_user.id
    #val[:response]="No response yet"
    inquiry = Inquiry.new
    inquiry.house_id = session[:house_id]
    inquiry.hunter_id = session[:hunter_id]
    inquiry.message = inquiry_params[:message]
    inquiry.subject = inquiry_params[:subject]

    if inquiry.save
      redirect_to viewhouses_hunter_path(@hunter), notice: 'Your Inquiry  was successfully created'
      # format.html { redirect_to houses_path, notice: 'Inquiry was successfully created.' }
      else
      format.html { render :new }
      format.json { render json: inquiry.errors, status: :unprocessable_entity }
    end
    # @inquiry = Inquiry.new(inquiry_params)
    #
    # respond_to do |format|
    #   if @inquiry.save
    #     format.html { redirect_to @inquiry, notice: 'Inquiry was successfully created.' }
    #     format.json { render :show, status: :created, location: @inquiry }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @inquiry.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @inquiry }
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:subject, :message, :hunter_id, :house_id)
    end
end
