class ApplicationController < ActionController::Base
  include SharedHelper
  before_action :set_sidebar

end
