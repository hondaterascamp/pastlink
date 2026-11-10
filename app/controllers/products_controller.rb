class ProductsController < ApplicationController
  def create
    @department = Department.find(params[:department_id])
    @product = @department.products.build(product_params)
    if @product.save
      redirect_to @department, notice: "製品を登録しました"
    else
      redirect_to @department, alert: @product.errors.full_messages.join("、")
    end
  end

  def show
    @product = Product.find(params[:id])
    @machines = @product.machines.order(:name)
    @troubles = @product.troubles.includes(:machine, :user).with_attached_photo.order(stopped_at: :desc)
  end

  private

  def product_params
    params.require(:product).permit(:name, :code)
  end
end