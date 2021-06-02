class UsersController < ApplicationController
  # You can see everyone?
  before_action :find_anyone, only: [:show]
  # You can only edit yourself
  before_action :find_myself, only: [:edit, :update, :destroy]
  #before_action :only_admins, except: [:index, :show, :edit, :update]
  before_action :authenticate_user!

  def only_admins
    if current_user.is_admin?
    else
      redirect_to users_url, notice: "Only admins can manage users"
    end
  end

  # GET /users
  # GET /users.json
  def index
    @q = User
      .includes(avatar_attachment: :blob)
      .ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_myself
    @user = current_user
  end

  def find_anyone
    @user = User
      .includes(employees: [:company])
      .friendly
      .find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params_to_permit = [
      :avatar,
      :bio,
      :email,
      :first_name,
      :last_name,
      :time_zone,
      :locale
    ]

    # Only admins can edit
    if current_user.is_admin?
      params_to_permit.push(:is_admin)
    end

    params.require(:user).permit(params_to_permit)
  end
end
