class ApplicationController < ActionController::Base
  helper :layout

  before_filter :authenticate_user!
  protect_from_forgery
end
