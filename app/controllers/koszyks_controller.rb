class KoszyksController < ApplicationController
  # GET /koszyks
  # GET /koszyks.json
  def index
    @koszyks = Koszyk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @koszyks }
    end
  end

  # GET /koszyks/1
  # GET /koszyks/1.json
  def show
    @koszyk = Koszyk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @koszyk }
    end
  end

  # GET /koszyks/new
  # GET /koszyks/new.json
  def new
    @koszyk = Koszyk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @koszyk }
    end
  end

  # GET /koszyks/1/edit
  def edit
    @koszyk = Koszyk.find(params[:id])
  end

  # POST /koszyks
  # POST /koszyks.json
  def create
    @koszyk = Koszyk.new(params[:koszyk])
    @koszyk.wlasciciel = current_user.username
    @koszyk.produkt_id = params[:koszyk_produkt_id]
    @koszyk.ilosc = params[:koszyk_ilosc]
    @koszyk.cena = params[:koszyk_cena]
    @koszyk.wartosc = (@koszyk.cena * @koszyk.ilosc)
    @koszyk.rozmiar = params[:rozmiar]

    respond_to do |format|
      if @koszyk.save
        format.html { redirect_to @koszyk, notice: 'Dodano do koszyka.' }
        format.json { render json: @koszyk, status: :created, location: @koszyk }
      else
        format.html { render action: "new" }
        format.json { render json: @koszyk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /koszyks/1
  # PUT /koszyks/1.json
  def update
    @koszyk = Koszyk.find(params[:id])

    respond_to do |format|
      if @koszyk.update_attributes(params[:koszyk])
        format.html { redirect_to @koszyk, notice: 'Koszyk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @koszyk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /koszyks/1
  # DELETE /koszyks/1.json
  def destroy
    @koszyk = Koszyk.find(params[:id])
    @koszyk.destroy

    respond_to do |format|
      format.html { redirect_to koszyks_url }
      format.json { head :no_content }
    end
  end
end
