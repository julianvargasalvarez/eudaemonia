class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @pending =     Candidate.where(status: 'pending'    ).order(id: :asc).page(params['pending']    ).per(5)
    @interviewed = Candidate.where(status: 'interviewed').order(id: :asc).page(params['interviewed']).per(5)
    @hired =       Candidate.where(status: 'hired'      ).order(id: :asc).page(params['hired']      ).per(5)

    respond_to do |format|
      format.html
      format.json {
        render json: {
          pending: {
            entries: render_to_string(partial: "candidate", collection: @pending, locals: {next_status: 'interviewed'}, formats: [:html]),
            pagination: view_context.paginate(@pending, param_name: 'pending')
          },
          interviewed: {
            entries: render_to_string(partial: "candidate", collection: @interviewed, locals: {next_status: 'hired'}, formats: [:html]),
            pagination: view_context.paginate(@interviewed, param_name: 'interviewed')
          },
          interviewed: {
            entries: render_to_string(partial: "candidate", collection: @hired, locals: {next_status: 'archived'}, formats: [:html]),
            pagination: view_context.paginate(@hired, param_name: 'hired')
          }
        }
      }
    end
  end
end
