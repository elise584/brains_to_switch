class BrainsController < ApplicationController
  before_action :set_brain, only: [:show, :edit, :update, :destroy]

  def index
    if params[:name].present? && params[:category] == ""
      @brains = policy_scope(Brain).order(created_at: :desc).search_by_name(params[:name])
      @brainsgeo = policy_scope(Brain).order(created_at: :desc).search_by_name(params[:name]).geocoded
    elsif params[:name] == "" && params[:category].present?
      @brains = policy_scope(Brain).order(created_at: :desc).search_by_category(params[:category])
      @brainsgeo = policy_scope(Brain).order(created_at: :desc).search_by_category(params[:category]).geocoded
    elsif params[:name].present? && params[:category].present?
      @brains = policy_scope(Brain).order(created_at: :desc).search_by_name(params[:name]).search_by_category(params[:category])
      @brainsgeo = policy_scope(Brain).order(created_at: :desc).search_by_name(params[:name]).search_by_category(params[:category]).geocoded
    else
      @brains = policy_scope(Brain).order(created_at: :desc)
      @brainsgeo = policy_scope(Brain).order(created_at: :desc).geocoded # returns brains with coordinates
    end

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
    params.require(:brain).permit(:name, :description, :category, :price, :address, :photo)
  end

  def set_brain
    @brain = Brain.find(params[:id])
    authorize @brain
  end
end
