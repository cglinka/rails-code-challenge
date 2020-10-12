require "csv"
class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all

    @total_sales = 0
    @total_sales = @sales.each { |sale|  @total_sales += sale.quantity.to_d * sale.product.price.to_d}
  end

  def upload_sales
    file = params[:csv].tempfile

    new_sales = []

    CSV.foreach(file, headers: true, header_converters: :symbol, converters: :all) do |row|
      puts "THIS IS THE ROW #{row}"
      # r = row.to_hash
      puts "THIS IS THE MERCHANT #{row[:merchant_name]}"

      # create or update merchant
      m = Merchant.create_or_find_by(merchant_name: row[:merchant_name]) do |merchant|
        merchant.merchant_address = row[:merchant_address]
      end
      # create or update customer
      c = Customer.create_or_find_by(name: row[:customer_name])
      # create or update product
      p = Product.create_or_find_by(description: row[:item_description], price: row[:item_price])
      # create sale
      # s = Sale.new(merchant_id: m.id, customer_id: c.id, product_id: p.id, quantity: :quantity)
      s = {merchant_id: m.id, customer_id: c.id, product_id: p.id, quantity: row[:quantity], created_at: Time.now, updated_at: Time.now}
      new_sales.append(s)
    end

    respond_to do |format|
      if Sale.insert_all!(new_sales)
        format.html { redirect_to sales_url, notice: "Upload successful"}
      else
        format.html { head :no_content, notice: "Upload failed"}
      end
    end
    # success notice
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:quantity, :merchant_id, :product_id, :customer_id)
    end
end
