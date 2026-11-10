class MachinesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @machine = @product.machines.build(machine_params)
    @machine.department = @product.department
    if @machine.save
      redirect_to @product, notice: "機械を登録しました"
    else
      redirect_to @product, alert: @machine.errors.full_messages.join("、")
    end
  end

  private

  def machine_params
    params.require(:machine).permit(:name, :code)
  end
end