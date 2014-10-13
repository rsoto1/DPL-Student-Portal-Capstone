class GithubWebhooksController < ApplicationController
  require "Octokit"
  include GithubWebhook::Processor
  skip_before_filter  :verify_authenticity_token, :authenticate_user!
  before_action :build_client

  def push(payload)
    puts "I got some JSON: #{payload.inspect}"
  end
  
  def ping(payload)
    puts "Repo Name: #{payload['repository']['full_name']}"
    puts "Repo Description: #{payload['repository']['description']}"
  end

  def pull_request(payload)
    if payload['action'] == 'opened'
      PullRequest.create(user: User.find_by(uid: payload['pull_request']['user']['id']),
                         assignment: Assignment.find_by(title: payload['pull_request']['title']),
                         repo: payload['pull_request']['head']['repo']['full_name'],
                         pull_request_number: payload['number'],
                         action: payload['action'],
                         link: payload['pull_request']['html_url'],
                         sha: payload['pull_request']['head']['sha'],
                         mergeable: payload['pull_request']['mergeable'],
                         title: payload['pull_request']['title'],
                         body: payload['pull_request']['body'],
                         merged: payload['pull_request']['merged'])
    else
      # user = User.find_by(uid: payload['pull_request']['user']['id'])
      pull_request = PullRequest.find_by(sha: payload['pull_request']['head']['sha'])
      pull_request.update(action: payload['action'],
                          mergeable: payload['pull_request']['mergeable'],
                          title: payload['pull_request']['title'],
                          body: payload['pull_request']['body'],
                          merged: payload['pull_request']['merged'])
    end
    pull_request_sha = payload['pull_request']['head']['sha']
    puts "Repo: #{payload['repository']['full_name']}"
    puts "Pull Request ##{payload['number']} was #{payload['action']}"
    puts '########## Info ###########'
    puts "User: #{payload['pull_request']['user']['login']}"
    puts "Title: #{payload['pull_request']['title']}"
    puts "Description: #{payload['pull_request']['body']}"
    puts "Link: #{payload['pull_request']['html_url']}"
    puts "Can be merged: #{payload['pull_request']['mergeable'].to_s}"
    repo = payload['pull_request']['head']['repo']['full_name']
    commits = @client.commits(repo, pull_request_sha)
    commits.each do |c|
      puts c.commit.message
    end
    binding.pry
  end

  def pull_request_review_comment(payload)
    puts 'this was a pull request comment'
  end

  def webhook_secret(payload)
    ENV['GITHUB_WEBHOOK_SECRET']
  end

  private

  def build_client
    @client = Octokit::Client.new client_secret: ENV['GITHUB_CLIENT_SECRET'],
                                  client_id: ENV['GITHUB_CLIENT_ID'] 
  end
end
