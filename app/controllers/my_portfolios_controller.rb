class MyPortfoliosController < ApplicationController
  def index
    @portfolio_items = MyPortfolio.all
  end

  def new
    @portfolio_item = MyPortfolio.new
  end

  def create
    @portfolio_item = MyPortfolio.new(params.require(:my_portfolio).permit(:title, :subtitle, :body))
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to my_portfolios_path, notice: "Your portfolio item is now live!" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = MyPortfolio.find(params[:id])
  end

  def update
    @portfolio_item = MyPortfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:my_portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to my_portfolios_path, notice: "The record was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = MyPortfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = MyPortfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to my_portfolios_url, notice: "Record was successfully destroyed." }
    end
  end
end
