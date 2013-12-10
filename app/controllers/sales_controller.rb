class SalesController < ApplicationController
  def index
    # make your sales objects available to the correlating view here
  end

  def import
    @sales = Sale.import(params[:file])
    binding.pry
    # redirect_to '/sales/' #, notice: "Sales imported"
  end
end
