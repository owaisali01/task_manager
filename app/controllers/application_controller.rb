class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_global_search_variable

  def set_global_search_variable
    @q = Task.search(params[:q])
  end
  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end
end
