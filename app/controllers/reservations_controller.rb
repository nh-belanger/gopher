class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @member = Member.find(params[:member_id])

    if @reservation.save
      flash[:notice] = "Reservation reserved"
      Dining.create(member: current_member, reservation: @reservation)
      redirect_to member_reservations_path
    else
      flash[:notice] = "Reservation was not created"
      render :new
    end
  end

  # TODO: add google calendar integration
  
  def join
    @reservation = Reservation.find(params[:reservation_id])
    Dining.create(reservation: @reservation, member: current_member)
    redirect_to member_reservations_path
  end

  def new
    @member = Member.find(params[:member_id])
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
    @members = @reservation.members
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size, :room)
  end
end
