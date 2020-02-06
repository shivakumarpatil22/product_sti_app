class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  def pens
    @products = Pen.all
  end

  def notebooks
    @products = Notebook.all.order('name asc, address asc')
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def pens
    @products = Product.where(type:'Pen').order('name asc, price desc')
    #@organizations = Business.all
  end

  def pen_query
    if params[:query] == 'first'
      @product = Pen.first
    elsif params[:query] == 'last'
      @product = Pen.last
    elsif params[:query] == 'find_by'
      @product =Pen.find_by(name:params[:name])
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  def grtr_price
    @dashboard = Product.select("date(created_at) as ordered_date, sum(price) as total_price").
  group("date(created_at)").having("sum(price) > ?", 100)
  end

  def search
    @product = Product.where("name like (?)", "%#{params[:search_text]}%").select("name").limit(5)
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path(@product.id), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_path(@product.id), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
     return params.require(:product).permit(:name, :price, :type, :inward_date, :color) if params.has_key?(:product)
     return params.require(:notebook).permit(:name, :price, :type, :inward_date, :color) if params.has_key?(:notebook)
      params.require(:pen).permit(:name, :price, :type, :inward_date, :color) if params.has_key?(:pen)
    end
end
