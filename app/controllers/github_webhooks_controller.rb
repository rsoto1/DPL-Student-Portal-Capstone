class GithubWebhooksController < ApplicationController
  require "Octokit"
  include GithubWebhook::Processor
  skip_before_filter  :verify_authenticity_token, :authenticate_user!
  before_action :build_client

  def push(payload)
    # TODO: handle push webhook
    # push = JSON.parse(payload.body.read)
    puts "I got some JSON: #{payload.inspect}"
  end
  def ping(payload)
    # TODO: handle push webhook
    # push = JSON.parse(payload)
    # puts "I got some JSON: #{payload.inspect}"
    puts "Repo Name: #{payload['repository']['full_name']}"
    puts "Repo Description: #{payload['repository']['description']}"
  end

  def pull_request(payload)
    pull_request_sha = payload['pull_request']['head']['sha']
    puts 'this was a pull request'
    puts "Repo: #{payload['repository']['full_name']}"
    puts "Pull Request ##{payload['number']} was #{payload['action']}"
    puts 'Info:'
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
