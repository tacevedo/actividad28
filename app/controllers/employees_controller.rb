class EmployeesController < ApplicationController

  def create

    @employee = Employee.new(employee_params)
    @employee.company_id = params[:company_id]
    @employee.area_id = employee_params[:area_id]
    @employee.save!
    redirect_to @employee.company

  end
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to @employee.company, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # def find_employee
    #   @employee = Employee.find(params[:id])
    # end
    def employee_params
      params.require(:employee).permit(:firs_name, :last_name, :email, :area_id)
    end
end
