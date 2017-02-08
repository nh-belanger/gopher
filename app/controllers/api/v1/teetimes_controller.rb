class Api::V1::TeetimesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @teetimes = Teetime.all.order("date DESC")
    @signed_in = !current_member.nil?
    @teetimes.each do |teetime|
      teetime.formatteddate = teetime.date.strftime('%a, %B %e ')
      teetime.formattedtime = teetime.time.strftime('%l:%M %p')
    end

    render json: {teetimes: @teetimes, signedIn: @signed_in}
  end

  def show
    @teetime = Teetime.find(params[:id])
    @members = @teetime.members.all
    @current_user = current_user
    # @members.each { |member| @teetimes << review.user }
    render json: { teetimes: @teetimes, members: @members, currentUser: @current_user }
  end
end
