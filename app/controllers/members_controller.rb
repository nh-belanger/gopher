class MembersController < ApplicationController
  # TODO: add admin functionality

  def index
    @members = Member.all
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_path
  end

  def show
    sign_out :member
    redirect_to "members#index"
  end

  # def show
  #   sign_out :member
  #   redirect_to welcome_index_path
  # end

  private

  def admin?
    if !member_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    elsif current_member.role != 'admin'
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def member_params
    params.require(:member).permit(:id)
  end
end
