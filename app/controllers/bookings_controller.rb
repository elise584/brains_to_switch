class BookingsController < ApplicationController
 before_action :set_brain
  def new
    @booking = current_user.bookings.new
    authorize @booking
  end
  def create

    @booking = current_user.bookings.new(booking_params)
    authorize @booking
    @booking.user_id = current_user.id
    @booking.brain.user = @brain.user
    if @booking.save!
      redirect_to dashboard_path #users/current:id/bookings <= faut créer la route
    else
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:validated, :start_date, :end_date)
  end

  def set_brain
    @brain = Brain.find(params[:brain_id])
    authorize @brain
  end
end





