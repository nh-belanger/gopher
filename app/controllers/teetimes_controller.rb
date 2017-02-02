class TeetimesController < ApplicationController
  def index
    @teetimes = Teetime.all
  end

  def destroy
    @teetime = Teetime.find(params[:id])
    @teetime.destroy
    redirect_to members_path
  end

  def edit
    @teetime = Teetime.find(params[:id])
    @member = @teetime.member
  end

  def show
    @teetime = Teetime.find(params[:id])
    @members = @teetime.members
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

  def new
    @member = Member.find(params[:member_id])
    @teetime = Teetime.new
  end

  private

  def teetime_params
    params.require(:teetime).permit(:date, :time, :starting_hole)
  end
end
