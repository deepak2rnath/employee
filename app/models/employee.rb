class Employee < ActiveRecord::Base
 
  validates :employee_name, presence: true, length: { minimum:1,maximum:50 }
  validates :city, presence: true, length: { minimum:1,maximum:100 }
  validates :mobile, length: { minimum:10, maximum:10 }
  
end