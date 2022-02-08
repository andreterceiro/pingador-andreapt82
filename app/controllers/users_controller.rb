class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :redirect_to_login_if_necessary,

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.password = Digest::MD5.hexdigest(user_params['password'] + User.get_salt)
    respond_to do |format|
      will_save = true
      unless User.verify_valid_active_value user_params['active']
        @user.errors.add('active', "this value is not valid")
        will_save = false
      end

      if will_save and @user.save
        format.html { redirect_to user_url(@user), notice: "Usuario was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      params = user_params
      password = params['password']
      if password.empty?
        params.delete("password")
      end

      will_save = true
      unless User.verify_valid_active_value user_params['active']
        @user.errors.add('active', "this value is not valid")
        will_save = false
      end

      if will_save and @user.update(params)
        unless password.empty?
          @user.password = Digest::MD5.hexdigest(params['password'] + User.get_salt) 
          @user.save
        end
        format.html { redirect_to user_url(@user), notice: "Usuario was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "Usuario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:login, :password, :active)
    end
end
