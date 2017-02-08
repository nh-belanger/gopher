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

    @member_can_join = false
    unless current_member.nil?
      @member_can_join = can_join?(@teetime)
    end
  end

  # TODO: make it so a teetime you are in cannot be joined twice

  def join
    @teetime = Teetime.find(params[:teetime_id])
    if @teetime.members.all.length < 4
      Timesheet.create(teetime: @teetime, member: current_member)
      redirect_to member_teetimes_path
      flash[:notice] = "You joined #{@teetime.creator}'s teetime."
    else
      redirect_to member_teetimes_path
      flash[:notice] = "Teetimes may have a maximum of four players."
    end
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
  # TODO: fix can't join if set to unjoinable

  private

  def teetime_params
    params.require(:teetime).permit(:date, :time, :unjoinable, :starting_hole, :creator, :formatted_date, :formatted_time, :creator_id)
  end

  def can_change?(teetime)
    # current_member == teetime.members.first || current_member.role == "admin"
    current_member.role == "admin" || current_member == teetime.members.first
  end

  def can_join?(teetime)
    teetime.unjoinable == false || teetime.members.all.length < 4
  end

  def authorize_member
    # if !member_signed_in? || !current_member.admin?
    if !member_signed_in? || !current_member.role == "admin"
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
