class CandidateController < ApplicationController
  include CableReady::Broadcaster

  def update
    Candidate.find(params[:id]).update(candidate_params)
    redirect_to dashboard_con_stimulus_path
  end

  def new
    @candidate = Candidate.new(status: 'pending')
  end

  def create
    candidate = Candidate.create(candidate_params)
    cable_ready["dashboard"].insert_adjacent_html(
      selector: "div.pending",
      position: "afterbegin",
      html: render_to_string(partial: "dashboard/candidate", locals: {candidate: candidate, next_status: 'interviewed'})
    )
    cable_ready.broadcast
    redirect_to new_candidate_path
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :status)
  end
end
