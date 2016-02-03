class EmployeesController < ApplicationController
    
    before_action :set_employee, only: [:edit,:update,:destroy,:show]
    
    
   def index
      @employees=Employee.all 
   end
   
    def new
        
        @employee=Employee.new
        
    end
    
    def create
    
           @employee=Employee.new(employee_params)
           
        if @employee.save
            flash[:success]="The employee details are successfully added"
            redirect_to employee_path(@employee) 
        else
            render 'new'
           #redirect_to Employee_path(@employee)  
        end
        
    end
  
    def show
        
    end
    
    def destroy
       
        @employee.destroy
        flash[:danger]="Employee Details are successfully deleted"
        redirect_to employees_path
    end
    
    def edit
        
    end
    
    
    def update
       
       if  @employee.update(employee_params)
           flash[:success]="Employee details are successfully updated"
           redirect_to employee_path(@employee)
       else
           render 'edit'
       end
           
    end
    
    private
    def set_employee
        @employee = Employee.find(params[:id]) 
    end
    def employee_params
        params.require(:employee).permit(:employee_name,:city,:mobile)
    end
end
