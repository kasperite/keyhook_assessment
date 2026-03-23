class Admin::BaseController < ApplicationController
  include Authentication
  helper_method :current_user

  def current_user
    Current.session&.user
  end
end