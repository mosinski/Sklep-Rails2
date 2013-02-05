class KoszyksController < ApplicationController
  # GET /koszyks
  # GET /koszyks.json
  def index
    if current_user
        @koszyks = Koszyk.find_all_by_wlasciciel(current_user.username)
	respond_to do |format|
         format.html # index.html.erb
         format.json { render json: @koszyks }
        end
    else
    redirect_to '/login', notice: 'Wymagane logowanie!'
    end
  end


  # POST /koszyks
  # POST /koszyks.json
  def create
    if current_user
    @koszyk = Koszyk.new(params[:koszyk])
    @koszyk.wlasciciel = current_user.username
    @koszyk.produkt_id = params[:koszyk_produkt_id]
    @koszyk.produkt_tytul = params[:koszyk_produkt_tytul]
    @koszyk.ilosc = params[:koszyk_ilosc]
    @koszyk.cena = params[:koszyk_cena]
    @koszyk.wartosc = (@koszyk.cena * @koszyk.ilosc)
    @koszyk.rozmiar = params[:rozmiar]
    if ((@koszyk.rozmiar != nil)&&(@koszyk.ilosc.to_f != 0.0))
    respond_to do |format|
      if @koszyk.save
        format.html { redirect_to root_url, notice: 'Dodano do koszyka.' }
        format.json { render json: @koszyk, status: :created, location: @koszyk }
      else
        format.html { render action: "new" }
        format.json { render json: @koszyk.errors, status: :unprocessable_entity }
      end
    end
    else
    	if @koszyk.rozmiar == nil
    		redirect_to '/produkts/'+@koszyk.produkt_id.to_s, notice: 'Nie wybrano rozmiaru!'
    	else @koszyk.ilosc.to_f == 0.0
    		redirect_to '/produkts/'+@koszyk.produkt_id.to_s, notice: 'Ilosc jest niepoprawna!'
   	end
    end
    else
    redirect_to '/login', notice: 'Wymagane logowanie'
    end
  end


  def wyczysc_koszyk
   if current_user
   Koszyk.find_all_by_wlasciciel(current_user.username).each {|r| r.destroy}
   redirect_to '/koszyks', notice: 'Koszyk pusty'
   else
   redirect_to '/login', notice: 'Wymagane logowanie!'
   end
  end

  def destroy
    if current_user
	@koszyk = Koszyk.find(params[:id])
	if current_user.username == @koszyk.wlasciciel
    	@koszyk.destroy

    	respond_to do |format|
      		format.html { redirect_to produkts_url }
      		format.json { head :no_content }
    	end
        end
    else
	redirect_to (:produkts), :notice => "Ten produkt nie jest w twoim koszyku!"
    end
  end

end
