class EmployeesController < ApplicationController
    
   def index
      @employees=Employee.all 
   end
   
    def new
        
        @employee=Employee.new
        
    end
    
    def create
    
           @employee=Employee.new(employee_params)
           
        if @employee.save
            flash[:notice]="The employee details are successfully added"
            redirect_to employee_path(@employee) 
        else
            render 'new'
           #redirect_to Employee_path(@employee)  
        end
        
    end
    
    def show
     @employee = Employee.find(params[:id])   
    end
    
    def edit
       @employee = Employee.find(params[:id])   
    end
    
    def update
       @employee = Employee.find(params[:id]) 
       
       if  @employee.update(employee_params)
           flash[:notice]="Employee details are successfully updated"
           redirect_to employee_path(@employee)
       else
           render 'edit'
       end
           
    end
    
    private
    def employee_params
        params.require(:employee).permit(:employee_name,:city,:mobile)
    end
end
