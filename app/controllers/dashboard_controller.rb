class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @pending =     Candidate.where(status: 'pending'    ).order(id: :asc).page(params['pending']    ).per(3)
    @interviewed = Candidate.where(status: 'interviewed').order(id: :asc).page(params['interviewed']).per(3)
    @hired =       Candidate.where(status: 'hired'      ).order(id: :asc).page(params['hired']      ).per(3)

    respond_to do |format|
      format.html
      format.json {
        render json: {
          entries: render_to_string(partial: "candidate", collection: @pending, locals: {next_status: 'interviewed'}, formats: [:html]),
          pagination: view_context.paginate(@pending, param_name: 'pending') }
      }
    end
  end
end
