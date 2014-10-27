require 'rails_helper'

RSpec.describe Staff::ReposController, :type => :controller do
  render_views
  before do
    @location = create(:location)
    @cohort = create(:cohort, location: @location)
    @staff = create(:staff)
    sign_in(@staff)
  end

  describe '#index' do
    it 'successfully gets the index page' do
      get :index, cohort_id: @cohort.id
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns the @repos variable' do
      get :index, cohort_id: @cohort.id
      expect(assigns(:repos)).to eq(@cohort.repos.all)
    end
  end

  describe '#show' do
    before do
      @repo = create(:repo,
                     cohort: @cohort)
    end
    it 'renders info about a repo' do
      get :show, id: @repo.id, cohort_id: @cohort.id
      expect(response).to be_success
      expect(assigns(:repo).name).to eq 'MyString/MyRepo'
      expect(response).to render_template('show')
    end
  end

  describe '#create' do
    before do
      @params = { repo: { name: 'Student/Repo',
                          link: 'https://example.com/student/repo'
                        },
                  cohort_id: @cohort.id
                }
    end

    it 'saves the repo' do
      expect {
        post :create, @params
      }.to change(Repo, :count).by(1)
    end

    it 'renders new template if unsuccessfull' do
      @params = { repo: { name: nil,
                          link: 'https://example.com/student/repo'
                        },
                  cohort_id: @cohort.id
                }
      post :create, @params
      expect(response).to render_template :new
    end
  end

  describe '#update' do
    before do
      @repo = create(:repo, cohort: @cohort)
      @params = { id: @repo.id,
                  cohort_id: @cohort.id,
                  repo: { name: 'Student/New_Repo',
                          link: 'https://example.com/student/new_repo' }
                }
    end

    it 'updates the repo' do
      patch :update, @params
      assert_response :redirect
      repo = Repo.find(@repo.id)
      expect(repo.name).to eq 'Student/New_Repo'
      expect(repo.link).to eq 'https://example.com/student/new_repo'
    end

    it 'renders edit template if unsuccessfull' do
      @params = { id: @repo.id,
                  cohort_id: @cohort.id,
                  repo: { name: nil,
                          link: 'https://example.com/student/new_repo' }
                }
      patch :update, @params
      expect(response).to render_template :edit
    end
  end

  describe '#destroy' do
    before do
      @repo = create(:repo, cohort: @cohort)
      @params = { id: @repo.id,
                  cohort_id: @cohort.id }
    end

    it 'destroys the repo' do
      expect {
        delete :destroy, @params
      }.to change(Repo, :count).by(-1)
    end
  end
end
