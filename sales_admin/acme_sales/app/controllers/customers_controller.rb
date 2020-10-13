class CustomersController < ApplicationController

  # GET /customers
  def index
    @customers = Customer.all
  end
end
