module SetCohort
  extend ActiveSupport::Concern

  private

  def set_cohort
    @cohort = Cohort.find(params[:cohort_id])
  end
end
