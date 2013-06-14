class RecipesController < ApplicationController
  require "open-uri"

  skip_before_filter :require_authentication

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    #this should only work when a user is logged in.
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to "/recipes/index"
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(params[:recipe])
      redirect_to "/recipes/index"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to "/recipes/index"
  end
end
