class Admin::BaseController < ApplicationController

  before_action :require_admin
  # before_filter :authenticate_user!
  # before_action :admin_only, :except => :show

    def require_admin
      render file: '/public/404' unless current_admin?
    end
end
