class BrainsController < ApplicationController
  def index
      @brains = Brain.all
  end

  def new
    @brain = Brain.new

  end

  def create
    @brain = Brain.new(brain_params)
    @brain.user_id = current_user.id
    if @brain.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def brain_params
    params.require(:brain).permit(:name, :description, :category, :price)
  end
end
