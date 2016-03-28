class Api::V1::OfficialsController < ApplicationController

  def index
    @filterrific = initialize_filterrific(Official, params[:filterrific]) or return
    @officials = @filterrific.find.page(params[:page])
  end

  def show
    @official = Official.find(params[:id])
  end

end
