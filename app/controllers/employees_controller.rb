class EmployeesController < ApplicationController
    
    def new
        
        @employee=Employee.new
        
    end
    
    def create
    
           @employee=Employee.new(employee_params)
           
        if @employee.save
            flash[:notice]="The employee details are successfully added"
            redirect_to Employee_path(@employee) 
        else
            render 'new'
           #redirect_to Employee_path(@employee)  
        end
        
    end
    
    def show
     @employee = employee.find(params[:id])   
    def employee_params
        params.require(:employee).permit(:employee_name,:city,:mobile)
    end
end
