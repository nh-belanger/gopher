# app/controllers/omniauth_callbacks_controller.rb
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @member = Member.find_for_google_oauth2(request.env["omniauth.auth"], current_member)

    if @member
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @member, :event => :authentication
    else
      redirect_to new_member_session_path, notice: 'Access Denied'
    end
  end
end
