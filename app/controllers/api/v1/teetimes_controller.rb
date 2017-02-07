class Api::V1::TeetimesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @teetimes = Teetime.all.order("date DESC")
    @signed_in = !current_member.nil?
    render json: {teetimes: @teetimes, signedIn: @signed_in}
  end

  def show
    @teetime = Teetime.find(params[:id])
    @members = @teetime.reviews.order("score DESC")
    @current_user = current_user
    # @reviews.each { |review| @users << review.user }
    render json: { teetimes: @teetimes, members: @members, currentUser: @current_user }
  end
end
