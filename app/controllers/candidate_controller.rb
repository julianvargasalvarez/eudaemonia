class CandidateController < ApplicationController
  def update
    Candidate.find(params[:id]).update(candidate_params)
    expire_page(:controller => 'dashboard', :action => 'index')
    redirect_to dashboard_index_path
  end

  private
  def candidate_params
    params.require(:candidate).permit(:status)
  end
end
