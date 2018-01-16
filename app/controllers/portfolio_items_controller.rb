class PortfolioItemsController < ApplicationController

  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = PortfolioItem.all
  end

  def new
    @portfolio_item = PortfolioItem.new
  end

  def create
    @portfolio_item = PortfolioItem.new(params.require(:portfolio_item).permit(:title,:subtitle,:body))

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

  private
    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end
end
