class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
   @bookings = current_user.bookings

   @brains = current_user.brains
  end
end
