class TeeTimeController < ApplicationController
  # TODO: add admin functionality

  def index
    @teetimes = TeeTime.all
  end

  def destroy
    @teetime = TeeTime.find(params[:id])
    @teetime.destroy
    redirect_to members_path # NOTE: This path was users_path, changed to members_path. could be wrong
  end



  private

  def teetime_params
    params.require(:teetime).permit(:id)
  end
end
