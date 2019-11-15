require 'open-uri'

class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
    parse = @cocktail.name.downcase
    url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{parse}"
    cocktail_db_serialized = open(url).read
    cocktail_db = JSON.parse(cocktail_db_serialized)
    if @img_url.nil?
      @img_url = "https://assets.afcdn.com/recipe/20180705/80346_w648h344c1cx1727cy777cxt0cyt0cxb3883cyb2588.jpg"
      @category = ""
      @iba = ""
      @recipe = ""
    else
      @category = cocktail_db['drinks'][0]['strCategory']
      @iba = cocktail_db['drinks'][0]['strIBA']
      @recipe = cocktail_db['drinks'][0]['strInstructions']
      @img_url = cocktail_db['drinks'][0]['strDrinkThumb']
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :img_url, :photo)
  end
end
