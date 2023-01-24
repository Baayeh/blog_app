class ApplicationController < ActionController::Based
  def current_user
    User.first
  end
end
