class AboutsController < ApplicationController
  before_action :find_about, only: [:show, :destroy, :edit, :update]

  def index
    @abouts = About.all
  end

  def show

  end

  def new
    @about = About.new
  end

  def create
    @about = About.new(about_params)

    if @about.save
      redirect_to root_path
    end
  end


  def update
    if @about.update(about_params)
      redirect_to about_index_path
    end

  end

  def edit

  end

  def destroy
    if @about.destroy
      redirect_to about_index_path
      flash[:notice] = "Successfuly deleted"
    end
  end
  private

  def about_params
    params.require(:about).permit(:mission, :vision, :his, :about_img)
  end

  def find_about
    @about = About.find(params[:id])
  end

end
