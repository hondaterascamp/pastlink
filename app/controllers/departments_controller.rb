class DepartmentsController < ApplicationController

  def index
    @department = Department.new
    @departments = Department.order(:name)
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path, notice: "Department was successfully created."
    else
      @departments = Department.order(:name)
      render :index, status: :unprocessable_entity
    end
  end

  def show
  @department = Department.find(params[:id])
  @products = @department.products.order(:name)
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end
