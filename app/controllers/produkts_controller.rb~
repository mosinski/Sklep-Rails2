class ProduktsController < ApplicationController
  # GET /produkts
  # GET /produkts.json
  def index
    @produkts = Produkt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @produkts }
    end
  end

  # GET /produkts/1
  # GET /produkts/1.json
  def show
    @produkt = Produkt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @produkt }
    end
  end

  # GET /produkts/new
  # GET /produkts/new.json
  def new
    if current_user
	if current_user.username == 'Administrator'||'Jadwiga'
		@produkt = Produkt.new

		respond_to do |format|
      			format.html # new.html.erb
      			format.json { render json: @produkt }
    		end
	end
    else
	redirect_to (:produkts), :notice => "Nie masz uprawnien do dodania produktu!"
    end
  end

  # GET /produkts/1/edit
  def edit
    @produkt = Produkt.find(params[:id])
  end

  # POST /produkts
  # POST /produkts.json
  def create
    if current_user
	if current_user.username == 'Administrator'||'Jadwiga'
    		@produkt = Produkt.new(params[:produkt])

   		 respond_to do |format|
      			if @produkt.save
        		format.html { redirect_to @produkt, notice: 'Produkt dodany do bazy.' }
        		format.json { render json: @produkt, status: :created, location: @produkt }
      			else
        		format.html { render action: "new" }
        		format.json { render json: @produkt.errors, status: :unprocessable_entity }
      			end
    		end
	end
    else
	redirect_to (:produkts), :notice => "Nie masz uprawnien do dodania produktu!"
    end
  end

  # PUT /produkts/1
  # PUT /produkts/1.json
  def update
    if current_user
	if current_user.username == 'Administrator'||'Jadwiga'
    		@produkt = Produkt.find(params[:id])

    		respond_to do |format|
      			if @produkt.update_attributes(params[:produkt])
        		format.html { redirect_to @produkt, notice: 'Produkt uaktualniono.' }
        		format.json { head :no_content }
      			else
        		format.html { render action: "edit" }
        		format.json { render json: @produkt.errors, status: :unprocessable_entity }
      			end
    		end
	end
    else
	redirect_to (:produkts), :notice => "Nie masz uprawnien do edycji produktu!"
    end
  end

  # DELETE /produkts/1
  # DELETE /produkts/1.json
  def destroy
    if current_user
	if current_user.username == 'Administrator'||'Jadwiga'

    	@produkt = Produkt.find(params[:id])
    	@produkt.destroy

    	respond_to do |format|
      		format.html { redirect_to produkts_url }
      		format.json { head :no_content }
    	end
	end
    else
	redirect_to (:produkts), :notice => "Nie masz uprawnien do usuniecia produktu!"
    end
  end
end
