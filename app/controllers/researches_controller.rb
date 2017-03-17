class ResearchesController < ApplicationController
  before_action :find_research, only: [:show, :edit, :update, :destroy]


  def index
    @researches = Research.all
  end

  def new
    @research = Research.new
  end

  def show
  end

  def create

      @research = Research.new(research_params)

      if @research.save
        redirect_to research_index_path
      end
  end

  def edit

  end

  def update
    if @research.update(research_params)
      redirect_to research_index_path
    end
  end

  def destroy
    if @research.destroy
      redirect_to research_index_path
    end
  end

  private

  def research_params
    params.require(:research).permit(:title, :author, :description, :callNo, :research_img)
  end

  def find_research
    @research = Research.find(params[:id])
  end


end
