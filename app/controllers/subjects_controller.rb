class SubjectsController < ApplicationController
  before_action :find_subj, only: [:show, :destroy, :edit, :update]

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subj_params)

    if @subject.save
      redirect_to subject_index_path
    end
  end

  def destroy

    if @subject.destroy
      redirect_to subject_index_path
    end
  end



  private

  def subj_params
     params.require(:subjects).permit(:subject_code, :subject_title, :units, :lec_units, :lec_labs, :course_description)
  end

  def find_subj
    @subject = Subject.find(params[:id])
  end
end
