class PortfolioItemsController < ApplicationController

  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = PortfolioItem.all
  end

  def angular
    @portfolio_items = PortfolioItem.angular
    render 'index'
  end

  def new
    @portfolio_item = PortfolioItem.new
  end

  def create
    @portfolio_item = PortfolioItem.new(portfolio_item_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html {redirect_to portfolio_items_path ,notice: "Your portfolio item has been created"}
      else
        format.html { render :new}
      end
    end
  end

  def show

  end

  def edit

  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html {redirect_to portfolio_items_path ,notice: "Your portfolio item has been destroyed"}
    end
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html {redirect_to portfolio_items_path ,notice: "Your portfolio item has been updated"}
      else
        format.html { render :edit}
      end
    end
  end

  private
    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end

    def portfolio_item_params
      params.require(:portfolio_item).permit(:title,:subtitle,:body, technologies_attributes:[:name])
    end
end
