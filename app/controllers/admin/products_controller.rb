class Admin::ProductsController < ApplicationController
   
  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end
  
  def show
    @product = Product.find(params[:id])
    @product_image = @product.image
    
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product.id)#notice: 'You have created book successfully.'?一覧の時はid がいらない。
  end
  

  
    def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      render :edit
    end
    end
  
  def destroy
    @product = Product.find(params[:id])  # データ（レコード）を1件取得
    @product.destroy  # データ（レコード）を削除
    redirect_to admin_products_path  # 投稿一覧画面へリダイレクト 
  end
  
  
 private

  def product_params
    params.require(:product).permit(:genre_id, :name, :explanation, :non_taced_price, :image, :is_active)
  end
end
