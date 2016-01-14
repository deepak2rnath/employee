class EmployeesController < ApplicationController
    
    def new
        
        @employee=Employee.new
        
    end
    
           def create
    
           #render plain: params[:employee].inspect
           @employee=Employee.new(employee_params)
           @employee.save
           redirect_to Employee_show(@employee)
           end
    
    private
    def employee_params
        params.require(:employee).permit(:employee_name,:city,:mobile)
    end
end