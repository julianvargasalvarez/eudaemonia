class CandidateController < ApplicationController
  def update
    puts "@" * 100
    puts params.inspect
    Candidate.find(params[:id]).update(candidate_params)
    redirect_to dashboard_index_path
  end

  private
  def candidate_params
    params.require(:candidate).permit(:status)
  end
end
