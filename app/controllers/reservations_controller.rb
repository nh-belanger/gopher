class ReservationsController < ApplicationController
  # TODO: add admin functionality

  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    # @reservation.member = current_member
    @member = Member.find(params[:member_id])
    # @reservation.member = @member

    if @reservation.save
      flash[:notice] = "Reservation reserved"
      Dining.create(member: current_member, reservation: @reservation)
      redirect_to member_reservations_path
    else
      flash[:notice] = "Reservation was not created"
      render :new
    end
  end

  def new
    @member = Member.find(params[:member_id])
    @reservation = Reservation.new
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size, :room)
  end
end
