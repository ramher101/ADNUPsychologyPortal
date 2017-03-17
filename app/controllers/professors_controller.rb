class ProfessorsController < ApplicationController
  before_action :find_professor, only: [ :show, :update, :destroy, :edit ]

  def index
    @professors = Professor.all
  end

  def show

  end

  def new
    @professor = Professor.new
  end


  def create
    @professor = Professor.new(professor_params)
      if @professor.save
          flash[:notice] = "Successfuly Added"
          redirect_to professor_index_path
      end

  end

  def update
    if @professor.update(professor_params)
       redirect_to professor_index_path
    end
  end

  def edit
  end

  def destroy
    if @professor.destroy
      flash[:notice] = "Successfuly deleted"
      redirect_to professor_index_path
    end
  end



  private

  def professor_params
    params.require(:professor).permit( :name, :position, :educ_attainment)
  end

  def find_professor
    @professor = Professor.find(params[:id])
  end

end
