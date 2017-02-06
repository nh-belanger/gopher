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

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to member_reservations_path
    flash[:notice] = "Reservation was Deleted"
  end

  # TODO: add google calendar integration

  def join
    @reservation = Reservation.find(params[:reservation_id])
    Dining.create(reservation: @reservation, member: current_member)
    redirect_to member_reservations_path
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @member = @reservation.members.first

    unless can_change?(@reservation)
      raise ActionController::RoutingError.new("Not Found")
    end

    @member_can_change = false
    unless current_member.nil?
      @member_can_change = can_change?(@reservation)
    end
  end

  def new
    @member = Member.find(params[:member_id])
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
    @members = @reservation.members
    @member = @reservation.members.first

    @member_can_change = false
    unless current_member.nil?
      @member_can_change = can_change?(@reservation)
    end
  end

  private

  def can_change?(reservation)
    # current_member == teetime.members.first || current_member.role == "admin"
    current_member.role == "admin" || current_member == reservation.members.first
  end

  def authorize_member
    # if !member_signed_in? || !current_member.admin?
    if !member_signed_in? || !current_member.role == "admin"
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size, :room)
  end
end
