class Staff::ReposController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :ensure_staff
  before_action :set_cohort
  before_action :set_repo, only: [:show, :edit, :update, :destroy]

  def index
    @repos = @cohort.repos.all
  end

  def show
  end

  def edit
  end

  def update
    if @repo.update(repo_params)
      redirect_to staff_cohort_repos_url,
                  notice: 'Repo was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @repo = Repo.new
  end

  def create
    @repo = @cohort.repos.build(repo_params)

    if @repo.save
      redirect_to staff_cohort_repos_url,
                  notice: 'Repo was successfully created.'
    else
      render :new
    end
  end

  def destroy
    begin
      @repo.destroy
      flash[:notice] = 'Repo deleted!'
    rescue StandardError => error
      flash[:notice] = error.message
    end
    redirect_to staff_cohort_repos_url
  end

  private

  def set_repo
    @repo = @cohort.repos.find(params[:id])
  end

  def repo_params
    params.require(:repo).permit(:name,
                                 :link,
                                 :cohort_id)
  end
end
