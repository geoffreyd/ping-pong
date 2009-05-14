require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  context "index action" do
    should "render index template" do
      get :index
      assert_template 'index'
    end
  end
  
  context "show action" do
    should "render show template" do
      get :show, :id => Game.first
      assert_template 'show'
    end
  end
  
  context "new action" do
    should "render new template" do
      get :new
      assert_template 'new'
    end
  end
  
  context "create action" do
    should "render new template when model is invalid" do
      Game.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
    end
    
    should "redirect when model is valid" do
      Game.any_instance.stubs(:valid?).returns(true)
      post :create
      assert_redirected_to game_url(assigns(:game))
    end
  end
  
  context "edit action" do
    should "render edit template" do
      get :edit, :id => Game.first
      assert_template 'edit'
    end
  end
  
  context "update action" do
    should "render edit template when model is invalid" do
      Game.any_instance.stubs(:valid?).returns(false)
      put :update, :id => Game.first
      assert_template 'edit'
    end
  
    should "redirect when model is valid" do
      Game.any_instance.stubs(:valid?).returns(true)
      put :update, :id => Game.first
      assert_redirected_to game_url(assigns(:game))
    end
  end
  
  context "destroy action" do
    should "destroy model and redirect to index action" do
      game = Game.first
      delete :destroy, :id => game
      assert_redirected_to games_url
      assert !Game.exists?(game.id)
    end
  end
end
