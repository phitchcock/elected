class Api::V1::SupervisorsController < ApplicationController
  def index
    @supervisors = Supervisor.all
  end
end
