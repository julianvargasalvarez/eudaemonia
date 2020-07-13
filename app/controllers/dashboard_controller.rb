class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @candidates = Candidate.order(id: :asc)
  end
end
