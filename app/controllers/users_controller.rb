class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  if current_user
	@user = User.find(params[:id])
	if current_user.username == 'Administrator'||'Moderator'||@user.username
	else
  	redirect_to produkts_url, :notice => 'Nie masz uprawnien aby edytowac!'
    	end
  else
  redirect_to :login, :notice => 'Zaloguj sie aby edytowac!'
  end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
	UserMailer.registration_confirmation(@user).deliver
        format.html { redirect_to(:produkts, :notice => 'Konto zarejestrowane!') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_url, notice: 'Konto uaktualnione!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
  if current_user
	if current_user.username == 'Administrator'||'Moderator'||@user.username
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
    	end
  else
  redirect_to produkts_url, notice: 'Nie masz odpowiednich uprawnien!'
  end

  def pomylka
    @user = User.find_by_persistence_token(params[:token_input])
    if @user != NIL
    @user.destroy

    respond_to do |format|
      format.html { redirect_to produkts_url, notice: 'Dziekujemy za zawidomienie!' }
      format.json { head :no_content }
    end
    else
    redirect_to produkts_url, notice: 'Niepoprawny kod dostepu!'
   end
  end
end
