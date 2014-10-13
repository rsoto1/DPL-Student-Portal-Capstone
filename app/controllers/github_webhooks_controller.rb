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
      # find the super secret tag code or set to an array with nil so it doesn't break shit later
      assignment = payload['pull_request']['title'].match(/\[.+\s(\d+)\]/) || [nil]
      pull_request = PullRequest.create(user: User.find_by(uid: payload['pull_request']['user']['id'].to_s),
                         # I spy, with my little eye...an assignment with the id referenced in the
                         # Orphan Annie secret message above. Otherwise, find an assignment whose title 
                         # matches the title of the pull request
                         assignment: Assignment.find_by(id: assignment[1] || 
                                     Assignment.find_by(name: payload['pull_request']['title']),
                         repo: payload['pull_request']['head']['repo']['full_name'],
                         pull_request_number: payload['number'],
                         action: payload['action'],
                         link: payload['pull_request']['html_url'],
                         sha: payload['pull_request']['head']['sha'],
                         mergeable: payload['pull_request']['mergeable'],
                         title: payload['pull_request']['title'],
                         body: payload['pull_request']['body'],
                         merged: payload['pull_request']['merged'])
      # Create an answer to associate the pull request to
      Answer.create(pull_request: pull_request,
                    user: pull_request.user,
                    assignment: pull_request.assignment,
                    title: pull_request.title,
                    body: pull_request.body)
    else
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
    # binding.pry
  end

  def pull_request_review_comment(payload)
    puts 'this was a pull request comment'
  end

  def issues(payload)
    description = payload['issue']['body']
    # binding.pry
    description += '\n' + payload['issue']['html_url']
    if payload['action'] == 'opened'
      Assignment.create(name: payload['issue']['title'],
                        description: description,
                        due_date: Date.tomorrow)
    else
      issue = Assignment.find_by(name: payload['issue']['title'])
      issue.update(description: description)
    end
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
