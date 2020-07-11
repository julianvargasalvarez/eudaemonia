class DashboardController < ApplicationController
  def index
    @candidates = Candidate.paginate(page: params[:page], per_page: 300).order(id: :asc)
  end
end
