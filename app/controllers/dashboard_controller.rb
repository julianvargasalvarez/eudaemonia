class DashboardController < ApplicationController
  before_action :authenticate_user!

  caches_page :index

  def index
    @candidates = Candidate.paginate(page: params[:page], per_page: 3).order(id: :asc)
  end
end
