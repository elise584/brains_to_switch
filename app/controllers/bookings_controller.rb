class BookingsController < ApplicationController
 before_action :set_brain, only: [:new, :create]
 before_action :set_booking, only: [:edit, :update, :destroy, :status_booking_accepted, :status_booking_declined]

  def new
    @booking = current_user.bookings.new
    authorize @booking
  end
  def create
    @booking = current_user.bookings.new(booking_params)
    authorize @booking
    @booking.brain = Brain.find(params[:brain_id])
    @booking.user_id = current_user.id
    if @booking.save!
      redirect_to dashboard_path #users/current:id/bookings <= faut créer la route
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path # modifier vers le dashboard une fois créé
  end

  def status_booking_accepted
    @booking.status = "accepted"
    @booking.save!
    redirect_to dashboard_path
  end

  def status_booking_declined
      @booking.status = "declined"
      @booking.save!

      redirect_to dashboard_path
  end

  private
  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end

  def set_brain
    @brain = Brain.find(params[:brain_id])
    authorize @brain
  end


  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end





