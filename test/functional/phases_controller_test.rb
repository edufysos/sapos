# Copyright (c) 2013 Universidade Federal Fluminense (UFF).
# This file is part of SAPOS. Please, consult the license terms in the LICENSE file.

require 'test_helper'

class PhasesControllerTest < ActionController::TestCase
  setup do
    @phase = phases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phase" do
    assert_difference('Phase.count') do
      post :create, :phase => @phase.attributes
    end

    assert_redirected_to phase_path(assigns(:phase))
  end

  test "should show phase" do
    get :show, :id => @phase.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @phase.to_param
    assert_response :success
  end

  test "should update phase" do
    put :update, :id => @phase.to_param, :phase => @phase.attributes
    assert_redirected_to phase_path(assigns(:phase))
  end

  test "should destroy phase" do
    assert_difference('Phase.count', -1) do
      delete :destroy, :id => @phase.to_param
    end

    assert_redirected_to phases_path
  end
end
