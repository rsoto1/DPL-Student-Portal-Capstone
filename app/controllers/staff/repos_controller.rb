class Staff::ReposController < ApplicationController
  include SetCohort
  before_action :authenticate_user!
  before_action :ensure_staff!
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
    respond_to do |format|
      if @repo.update(repo_params)
        format.html { redirect_to staff_cohort_repos_url, notice: 'Repo was successfully updated.' }
        format.json { render :show, status: :ok, location: @repo }
      else
        format.html { render :edit }
        format.json { render json: @repo.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @repo = Repo.new
  end

  def create
    @repo = @cohort.repos.build(repo_params)

    respond_to do |format|
      if @repo.save
        format.html { redirect_to staff_cohort_repos_url, notice: 'Repo was successfully created.' }
        format.json { render :show, status: :created, location: @repo }
      else
        format.html { render :new }
        format.json { render json: @repo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @repo.destroy
      flash[:notice] = 'Repo deleted!'
    rescue StandardError => error
      flash[:notice] = error.message
    end
    respond_to do |format|
      format.html { redirect_to staff_cohort_repos_url }
      format.json { head :no_content }
    end
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
