class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
    logger.debug "#{request.env["omniauth.auth"]}"
    if @user.persisted?
      flash[:notice] = 'Loggeado con Google+!'
      sign_in_and_redirect @user, :event => :authentication
    else
      #This never happens
      flash[:notice] = "Estamos casi! Danos una contraseña para ti!"
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end