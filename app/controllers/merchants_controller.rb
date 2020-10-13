class MerchantsController < ApplicationController

  # GET /merchants
  def index
    @merchants = Merchant.all
  end
end
