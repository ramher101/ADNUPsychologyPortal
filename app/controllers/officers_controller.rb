class OfficersController < ApplicationController

  before_action :find_officer, only: [:show, :edit, :update, :destroy]


  def index
    @officers = Officer.all
  end

  def new
    @officer = Officer.new
  end

  def show
  end

  def create

      @officer = Officer.new(officer_params)

      if @officer.save
        redirect_to officer_index_path
      end
  end

  def edit

  end

  def update
    if @officer.update(officer_params)
      redirect_to officer_index_path
    end
  end

  def destroy

  end

  private

  def officer_params
    params.require(:officer).permit(:president, :internalvp, :externalvp, :secretary, :treasurer, :auditor, :pio, :fourthrep, :thirdrep, :secondrep, :vpgroup, :undersec, :coh, :undersec2, :fgh, :undersec3, :moderator)
  end

  def find_officer
    @officer = Officer.find(params[:id])
  end


end
