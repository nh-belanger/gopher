class TeetimesController < ApplicationController
  # TODO: add admin functionality

  def index
    @teetimes = Teetime.all
  end

  def destroy
    @teetime = Teetime.find(params[:id])
    @teetime.destroy
    redirect_to members_path # NOTE: This path was users_path, changed to members_path. could be wrong
  end

  def edit
    @teetime = Teetime.find(params[:id])
    @member = @teetime.member
  end

  def create
    @teetime = Teetime.new(teetime_params)
    # @teetime.member = current_member
    @member = Member.find(params[:member_id])
    # @teetime.member = @member

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
