class SubjectsController < ApplicationController

  def index
    @Subjects = Subject.all
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



  private

  def subj_params
     params.require(:subjects).permit(:subject_code, :subject_title, :units, :lec_units, :lec_labs)
  end

  def find_subj
    @subject = Subject.find(params[:id])
  end
end
