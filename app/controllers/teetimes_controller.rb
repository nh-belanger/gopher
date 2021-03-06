class TeetimesController < ApplicationController
  # before_action :authorize_member, except: [:index, :show]

  require 'forecast_io'


  def index
    @teetimes = Teetime.all
    @member_can_create = !current_member.nil?

    @teetimes.each do |teetime|
      teetime.formatted_date = teetime.date.strftime('%a, %B %e ')
      teetime.formatted_time = teetime.time.strftime('%l:%M %p')
    end
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
    @teetime_requests = Teetimerequest.where(teetime_id: @teetime.id)

    @member_can_change = false
    unless current_member.nil?
      @member_can_change = can_change?(@teetime)
    end

    @member_can_join = false
    unless current_member.nil?
      @member_can_join = can_join?(@teetime)
    end


    @date_part = @teetime.date.to_s
    @time_part = @teetime.time.strftime('%H:%M:%S')
    @date_time = "#{@date_part}T#{@time_part}"

    @latitude = 42.3756
    @longitude = -71.1695
    @weather_summary = ForecastIO.forecast(@latitude, @longitude, time: @date_time).currently.summary
    @weather_temperature = ForecastIO.forecast(@latitude, @longitude, time: @date_time).currently.temperature
  end

  # TODO: make it so a teetime you are in cannot be joined twice
  # TODO: make is so you can leave a teetime

  def join
    @teetime = Teetime.find(params[:teetime_id])

    Timesheet.create(teetime: @teetime, member: current_member)
    Teetimerequest.where(teetime_id: @teetime.id, member_id: @teetime.members.last.id).destroy_all

    if @teetime.members.all.length == 4
      @teetime.full = true;
    end

    if @teetime.save
      flash[:notice] = "You joined #{@teetime.creator}'s teetime."
      redirect_to member_teetimes_path
    end
  end

  def joinrequest
    @teetime = Teetime.find(params[:teetime_id])

    Teetimerequest.create(member_id: current_member.id, teetime_id: @teetime.id)

    flash[:notice] = "You requested to joined #{@teetime.members.first.first_name} #{@teetime.members.first.last_name}'s teetime."
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

    @latitude = 42.3756
    @longitude = -71.1695
    @weather_summary = ForecastIO.forecast(@latitude, @longitude).currently.summary
    @weather_temperature = ForecastIO.forecast(@latitude, @longitude).currently.temperature
  end

  # TODO: can't join teetime if 4 or more people already joined
  # TODO: fix can't join if set to unjoinable

  private

  def teetime_params
    params.require(:teetime).permit(:date, :time, :unjoinable, :full, :starting_hole, :creator, :formatted_date, :formatted_time, :creator_id)
  end

  def can_change?(teetime)
    # current_member == teetime.members.first || current_member.role == "admin"
    current_member.role == "admin" || current_member == teetime.members.first
  end

  def can_join?(teetime)
    !teetime.unjoinable && teetime.members.all.length < 4
  end

  def authorize_member
    # if !member_signed_in? || !current_member.admin?
    if !member_signed_in? || !current_member.role == "admin"
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  ForecastIO.configure do |configuration|
    configuration.api_key = '3005c7b585dcfef488065585a2bee2a3'
  end


end
