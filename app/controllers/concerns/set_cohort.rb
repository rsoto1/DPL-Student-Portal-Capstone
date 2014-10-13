module SetCohort
  extend ActiveSupport::Concern

  private

  def set_cohort
    if current_user.student?
      @cohort = current_user.cohort
    else
      @cohort = Cohort.find(params[:cohort_id])
    end
  end
end
