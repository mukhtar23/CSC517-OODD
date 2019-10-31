class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def verify?(user)
    unless logged_in_user?(user) || logged_in_admin?
      log_out
      redirect_to root_path
      return false
    end
    #if the user is the administator, we set its role to 1
    if user.id == 19
      current_user.role = 1
      current_user.save
    else
      current_user.role = 0
      current_user.save
    end
    return true
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    return unless verify?(@user)

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    return unless verify?(@user)
  end

  # POST /users
  # POST /users.json
  def create

    new_user = User.find_by_email(user_params[:email])
    #email account don't exists
    if new_user.nil?
      new_user = User.new(user_params)
      params.inspect
      new_user.save
      #new user wants to be a realtor
      if new_user.role == 2
        #company 3 is just an empty company whose name is "no company seleted"
        new_realtor = new_user.create_realtor(company_id: 3)
        new_realtor.save
      end
      #new user wants to be hunter
      if new_user.role == 3
        new_hunter = new_user.create_hunter
        new_hunter.save
      end
      if logged_in_admin?
        redirect_to users_path, notice: 'User account was successfully created. AAA!'
      else
        log_in new_user
        redirect_to new_user, notice: 'User account was successfully created. AAA!'
      end
      # log_in new_user
      # redirect_to new_user, notice: 'User account was successfully created. AAA!'
    #email account exists
    else
      existing_user = new_user # user found in db
      #if password matches, allow user to add new role
      if user_params[:password] == existing_user.password
          #if not a realtor and wanna be a realtor
          if (existing_user.realtor.nil?) && user_params[:role] == '2'
            #company 3 is just an empty company whose name is "no company seleted"
            tmp = existing_user.create_realtor(company_id: 3)
            tmp.save
            log_in existing_user
            redirect_to existing_user, notice: 'Realtor role was successfully created. BBB!'
          else
            #if not a hunter and wanna be a hunter
            user_params.inspect
            if (existing_user.hunter.nil?) && user_params[:role] == '3'
              tmp = existing_user.create_hunter
              tmp.save
              log_in existing_user
              redirect_to existing_user, notice: 'Hunter role was successfully created. CCC!'
            else # duplicated registration, redirected to login
              redirect_to '/signup', notice: 'Already registered or wrong credentials'
            end
          end
      #if password not match, redirect to login
      else
        redirect_to '/signup', notice: 'Password not correct, try again.'
      end

    end


=begin
    @user = User.new(user_params)

    # @realtor = Realtor.new(user_id: @user.id)

    respond_to do |format|
      if @user.save
        if @user.role == 2
          # @realtor = Realtor.create(user_id: @user.id)
          # session[:user_id] = @user.id
          @realtor = Realtor.create(user_id: @user.id)
        end
        if @user.role == 1
          format.html { redirect_to current_user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          log_in @user
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        end
        # log_in @user
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
=end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        # if current_user.role == 1
          format.html { redirect_to current_user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
      else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      #   format.html { redirect_to @user, notice: 'User was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @user }
      #  else
      #    format.html { render :edit }
      #    format.json { render json: @user.errors, status: :unprocessable_entity }
      # end
      #
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :contact_method, :role)
    end
end
