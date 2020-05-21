class BrainsController < ApplicationController
  before_action :set_brain, only: [:show, :edit, :update, :destroy]

  def index
    @brains = policy_scope(Brain).order(created_at: :desc)
    @brainsgeo = Brain.geocoded # returns brains with coordinates

    @markers = @brainsgeo.map do |brain|
      {
        lat: brain.latitude,
        lng: brain.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { brain: brain })
      }
    end
  end

  def new
    @brain = current_user.brains.new
    authorize @brain
  end

  def create
    @brain = current_user.brains.new(brain_params)
    authorize @brain
    @brain.user_id = current_user.id
    if @brain.save!
      redirect_to brains_path # modifier vers le dashboard une fois créé
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @brain.update(brain_params)
      redirect_to brain_path(@brain)
    else
      render :edit
    end
  end

  def destroy
    @brain.destroy
    redirect_to brains_path # modifier vers le dashboard une fois créé
  end


  private
  def brain_params
    params.require(:brain).permit(:name, :description, :category, :price, :photo)
  end

  def set_brain
    @brain = Brain.find(params[:id])
    authorize @brain
  end
end
