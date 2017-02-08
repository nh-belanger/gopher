class TeetimesController < ApplicationController
  # before_action :authorize_member, except: [:index, :show]

  def index
    @teetimes = Teetime.all
    @member_can_create = !current_member.nil?
  end

  def destroy
    @teetime = Teetime.find(params[:id])
    @teetime.destroy
    redirect_to member_teetimes_path
    flash[:notice] = "Teetime was Deleted"
  end

  def edit
    @teetime = Teetime.find(params[:id])
    @member = @teetime.members.first

    unless can_change?(@teetime)
      raise ActionController::RoutingError.new("Not Found")
    end

    @member_can_change = false
    unless current_member.nil?
      @member_can_change = can_change?(@teetime)
    end
  end

  def show
    @teetime = Teetime.find(params[:id])
    @members = @teetime.members
    @member = @teetime.members.first

    @member_can_change = false
    unless current_member.nil?
      @member_can_change = can_change?(@teetime)
    end
  end

  def join
    @teetime = Teetime.find(params[:teetime_id])
    Timesheet.create(teetime: @teetime, member: current_member)
    redirect_to member_teetimes_path
  end

  def create
    @teetime = Teetime.new(teetime_params)

    @member = Member.find(params[:member_id])

    if @teetime.save
      flash[:notice] = "Teetime reserved"
      Timesheet.create(member: current_member, teetime: @teetime)
      redirect_to member_teetimes_path
    else
      flash[:notice] = "Teetime was not created"
      render :new
    end
  end

  def update
    @teetime = Teetime.find(params[:id])

    unless can_change?(@teetime)
      raise ActionController::RoutingError.new("Not Found")
    end

    if @teetime.update(teetime_params)
      flash[:notice] = "You edited a teetime."
      redirect_to member_teetime_path(@teetime)
    else
      flash[:notice] = @item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def new
    @member = Member.find(params[:member_id])
    @teetime = Teetime.new
  end

  # TODO: can't join teetime if 4 or more people already joined

  private

  def teetime_params
    params.require(:teetime).permit(:date, :time, :starting_hole, :creator, :formatteddate, :formattedtime)
  end

  def can_change?(teetime)
    # current_member == teetime.members.first || current_member.role == "admin"
    current_member.role == "admin" || current_member == teetime.members.first
  end

  def authorize_member
    # if !member_signed_in? || !current_member.admin?
    if !member_signed_in? || !current_member.role == "admin"
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
