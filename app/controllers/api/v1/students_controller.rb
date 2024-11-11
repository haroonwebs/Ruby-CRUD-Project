class Api::V1::StudentsController < ApplicationController
  def index
    students = Student.all
    if students
    render json: students, status: 200
    else
      render json:{error:"Sudents Not Found"}, status: 404
   end
  end

  def show
    student = Student.find_by(id: params[:id])
    if student
      render json: student, status: 200
      else
        render json: {error: "Student with this id not Found"}
      end 
  end

  def create
    student = Student.new(student_params)

    if student.save
      render json: student, status: 200
      else
        render json: {error: "Somthing gose wrong while creating new student"}, status: 422
      end
  end

  def update
    student = Student.find_by(id: params[:id])
    if student
      if student.update(student_params)
        render json: { message: "Updated Successfully", student: student }, status: 200
      else
        render json: { error: "Something went wrong while updating" }, status: 422
      end
    else
      render json: { error: "Student with this ID not found" }, status: 404
    end
  end
  

  def destroy
    student = Student.find_by(id: params[:id])
    if student
      if student.destroy
        render json: {message:"Student Deleted Successfuly", student: student}, status: 200
        else
          render json: {error:"Something went wrong while Deleting Student"}, status: 422
        end
        else
          render json: {error: "Student Not Found"}, status: 404
        end
    
  end
  private 
  def student_params 
    params.require(:student).permit(:fname, :lname, :age)
  end

end
