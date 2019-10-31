class RealtorsController < ApplicationController
  before_action :set_realtor, only: [:show, :edit, :update, :destroy]

  def verify?(realtor)
    unless logged_in_realtor?(realtor) || logged_in_admin?
      log_out
      redirect_to root_path
      return false
    end
    return true
  end

  # PUT realtors/:id/addhousepic/:house_id
  def inserthousepic
    params.inspect
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
    @house = House.find(params[:house_id])
    @house.images.attach(params[:image])
    @house.save

    redirect_to viewallhouses_realtor_path(@realtor)
  end

  # GET /realtors
  # GET /realtors.json
  def index
    if logged_in_admin?
    @realtors = Realtor.all
    else
      log_out
      redirect_to root_path
    end
  end

  # GET realtors/:id/addhousepic/:house_id
  def addhousepic
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
    @house = House.find(params[:house_id])
  end

  # GET /realtors/:id/home
  def home
    #Henry - new RESTful action, home page for each realtor
    @realtor = Realtor.find(params[:id])
    current_user.role = 2
    current_user.save
    return unless verify?(@realtor)
  end

  # GET /realtors/:id/create_company
  def new_company
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
  end

  # PUT /realtors/:id/create_company
  def create_company
    params.inspect
    realtor = Realtor.find(params[:id])
    return unless verify?(realtor)
    company = Company.new
    company.name = params[:name]
    company.address = params[:address]
    company.website = params[:website]
    company.size = params[:size]
    company.year_founded = params[:year_founded]
    company.revenue = params[:revenue]
    company.synopsis = params[:synopsis]
    company.save
    flash[:notice] = 'You company is created!'
    redirect_to home_realtor_path(realtor)
  end

  # GET /realtors/:id/viewbuyers
  def viewbuyers
    @realtor = Realtor.find(params[:id])
    #HenryMod
    return unless verify?(@realtor)
    company = @realtor.company
    houses = company.houses
    @interests = Interest.all.select {|x| houses.include?(x.house)}
  end

  # GET /realtors/:id/listhouse
  def listhouse
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
  end

  # PUT /realtors/:id/listhouse
  def inserthouse
    params.inspect
    realtor = Realtor.find(params[:id])
    return unless verify?(realtor)
    house=House.new
    house.location = params[:location]
    house.square_ft = params[:square_ft]
    house.year_built = params[:year_built]
    house.style = params[:style]
    house.floor = params[:floor]
    house.price = params[:price]
    house.basement = params[:basement]
    house.owner = params[:owner]
    house.contact_info = params[:contact_info]
    house.realtor_id = realtor.id
    house.company_id = realtor.company.id
    house.save
    flash[:notice] = 'You house is inserted!'
    redirect_to home_realtor_path(realtor)
  end
def viewinterest
  realtor = Realtor.find(params[:id])
  return unless verify?(realtor)
  @interests=Interest.all

end
  # GET /realtors/1/editmyhouses
  def editmyhouses
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
    @houses = @realtor.houses
  end

  # GET /realtors/1/showhousepic/:house_id
  def showhousepic
    params.inspect
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
    @house = House.find(params[:house_id])
  end

  # GET /realtors/:id/deletemyhouses/:house_id
  def deletehouse
    realtor = Realtor.find(params[:id])
    house = House.find(params[:house_id])
    return unless verify?(realtor)
    if house.realtor_id != realtor.id
      flash[:notice] = 'House not listed by you!'
      redirect_to home_realtor_path(realtor)
    else
      house.destroy
      redirect_to  editmyhouses_realtor_path(realtor)
    end
  end

  # GET /realtors/1/viewreplyinquiries
  def viewreplyinquiries
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
    company = @realtor.company
    @houses = company.houses
    @inquries = Inquiry.all.select { |x| @houses.include?(x.house) }
  end

  # PUT /realtors/:id/replyinquiries/:inquiry_id
  def replyinquiry
    realtor = Realtor.find(params[:id])
    return unless verify?(realtor)

  end

  # GET /realtors/1/viewallhouses
  def viewallhouses
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
    @houses = House.all
  end

  # GET /realtors/1/editmyhouses/2
  def edithouse
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
    @house = House.find(params[:house_id])
  end

  # PUT /realtors/1/editmyhouses/2
  def updatehouse
    params.inspect
    realtor=Realtor.find(params[:id])
    return unless verify?(realtor)
    house=House.find(params[:house_id])
    if house.realtor_id != realtor.id
      flash[:notice] = 'The house is not posted by you!'
      redirect_to home_realtor_path(realtor)
    else
      house.location = params[:location]
      house.square_ft = params[:square_ft]
      house.year_built = params[:year_built]
      house.style = params[:style]
      house.floor = params[:floor]
      house.price = params[:price]
      house.basement = params[:basement]
      house.owner = params[:owner]
      house.contact_info = params[:contact_info]
      house.save
      flash[:notice] = 'You house is updated!'
      redirect_to home_realtor_path(realtor)
    end
  end

  # GET /realtors/1/editmycompany
  def editmycompany
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
  end


  # PUT /realtors/1/editcompany
  def updatemycompany
    params.inspect
    realtor = Realtor.find(params[:id])
    return unless verify?(realtor)
    company = realtor.company
    company.name = params[:name]
    company.address = params[:address]
    company.website = params[:website]
    company.size = params[:size]
    company.year_founded = params[:year_founded]
    company.revenue = params[:revenue]
    company.synopsis = params[:synopsis]
    company.save
    flash[:notice] = 'You company info is updated!'
    redirect_to home_realtor_path(realtor)
  end

  # GET /realtors/1
  # GET /realtors/1.json
  def show
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
  end

  # GET /realtors/new
  def new
    @realtor = Realtor.new
  end

  # GET /realtors/1/edit
  def edit
    @realtor = Realtor.find(params[:id])
    return unless verify?(@realtor)
  end

  # POST /realtors
  # POST /realtors.json
  def create
    params.inspect
    #check if the account exists
    new_user = User.find_by_email(params[:email])

    if new_user.nil? # if not a user
      puts 'not a user, create new user and create realtor'
      new_user = User.new

      new_user.name = params[:name]
      new_user.email = params[:email]
      new_user.phone = params[:phone]
      if params[:set_pw] == '0'
        redirect_to new_realtor_path
      end
      new_user.password = params[:password]
      new_realtor = new_user.create_realtor(company_id: params[:company_id])
      new_user.save
      new_realtor.save
      flash[:notice] = 'You are registered with us and become a Realtor!'
      redirect_to new_realtor

    else if new_user.realtor.nil? # is a user, not a realtor

           if new_user.name != params[:name] || new_user.password != params[:password] || new_user.phone != new_user.phone.to_i
             flash[:notice] = 'Email registered, and your credentials entered do not match our record'
             redirect_to new_realtor_path
           else
             new_realtor = new_user.create_realtor(company_id: params[:company_id])
             new_realtor.save
             flash[:notice] = 'You become a Realtor!'
             redirect_to new_realtor
           end
         else # is a user, is a realtor, wrong
           flash[:notice] = 'Your email is already registered a Realtor!'
           redirect_to new_realtor_path
         end
    end


  end

  # PATCH/PUT /realtors/1
  # PATCH/PUT /realtors/1.json
  def update
    params.inspect

    real_tmp=Realtor.find(params[:id])
    return unless verify?(real_tmp)
    if real_tmp.nil?
      flash[:notice] = 'Realtor being edited does not exist.'
    end
    real_tmp.user.name = params[:name]
    real_tmp.user.email = params[:email]
    real_tmp.user.phone = params[:phone]
    if params[:set_pw] == '1'
      real_tmp.user.password = params[:password]
    end
    real_tmp.company_id = params[:company_id]
    real_tmp.save
    real_tmp.user.save
    houses = real_tmp.houses
    houses.each do |h|
      h.company_id = real_tmp.company_id
      h.save
    end

    flash[:notice] = 'Realtor was successfully updated.'
    redirect_to @realtor
  end


  #get 'realtors/:id/InquiryRespond/:inquiry_id', to: 'realtors#new_reply'
  def new_reply
    @realtor = Realtor.find(params[:id])
    @inquiry = Inquiry.find(params[:inquiry_id])
  end

  #put 'realtors/:id/InquiryRespond/:inquiry_id', to: 'realtors#create_reply'
  def create_reply
    @realtor = Realtor.find(params[:id])
    @inquiry = Inquiry.find(params[:inquiry_id])
    @inquiry.response = params[:response][0]
    @inquiry.save

    ApplicationMailer.email_notify(@inquiry.hunter.user).deliver

    flash[:notice] = 'Reply was successfully sent.'
    redirect_to viewreplyinquiries_realtor_path(@realtor)
  end

  # DELETE /realtors/1
  # DELETE /realtors/1.json
  def destroy
    @realtor.destroy
    respond_to do |format|
      format.html { redirect_to realtors_url, notice: 'Realtor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realtor
      @realtor = Realtor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def realtor_params
      params.require(:realtor).permit(:user_id, :company_id)
    end
end
