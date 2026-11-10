class TroublesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @trouble = @product.troubles.build(trouble_params)
    @trouble.user = Current.user

    machine_name = @trouble.machine_name.to_s.strip
    if machine_name.present?
      @trouble.machine = @product.machines.find_or_create_by(name: machine_name) do |machine|
        machine.department = @product.department
      end
    end

    if @trouble.save
      redirect_to @product, notice: "トラブルを登録しました"
    else
      redirect_to @product, alert: @trouble.errors.full_messages.join("、")
    end
  end

  private

  def trouble_params
    params.require(:trouble).permit(:machine_name, :content, :stopped_at, :downtime, :status, :cause, :action, :photo)
  end
end