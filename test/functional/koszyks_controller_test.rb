require 'test_helper'

class KoszyksControllerTest < ActionController::TestCase
  setup do
    @koszyk = koszyks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:koszyks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create koszyk" do
    assert_difference('Koszyk.count') do
      post :create, koszyk: { cena: @koszyk.cena, ilosc: @koszyk.ilosc, produkt_id: @koszyk.produkt_id, wartosc: @koszyk.wartosc, wlasciciel: @koszyk.wlasciciel }
    end

    assert_redirected_to koszyk_path(assigns(:koszyk))
  end

  test "should show koszyk" do
    get :show, id: @koszyk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @koszyk
    assert_response :success
  end

  test "should update koszyk" do
    put :update, id: @koszyk, koszyk: { cena: @koszyk.cena, ilosc: @koszyk.ilosc, produkt_id: @koszyk.produkt_id, wartosc: @koszyk.wartosc, wlasciciel: @koszyk.wlasciciel }
    assert_redirected_to koszyk_path(assigns(:koszyk))
  end

  test "should destroy koszyk" do
    assert_difference('Koszyk.count', -1) do
      delete :destroy, id: @koszyk
    end

    assert_redirected_to koszyks_path
  end
end
