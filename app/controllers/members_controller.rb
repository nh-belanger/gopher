class MembersController < ApplicationController
  # TODO: add admin functionality

  def index
    @members = Member.all
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to users_path
  end

  private

  def member_params
    params.require(:user).permit(:id)
  end
end
