class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :date])
  end
end

#nickname:"あ", first_name:"あ", last_name:"あ", first_name_kana:"ア", last_name_kana:"ア", date:"2000/12/12", email:"kkk@.gamil.com", password:"aaaaaa00"