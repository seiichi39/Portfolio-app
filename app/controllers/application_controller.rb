class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_user
    if params[:id] == "sign_out"
      redirect_to controller: 'devise/sessions', action: 'destroy'
    else
      @user = User.find(params[:id])
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end  

end
