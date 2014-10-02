module SetCohort
  extend ActiveSupport::Concern

  private

  def set_cohort
    @cohort = Cohort.find(params[:id])
  end
end
