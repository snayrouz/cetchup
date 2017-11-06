class RootController < ApplicationController
  before_filter :require_login

  def ember
    render :ember, layout: 'ember'
  end
end
