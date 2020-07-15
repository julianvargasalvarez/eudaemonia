class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @candidates = Candidate
  end
end
