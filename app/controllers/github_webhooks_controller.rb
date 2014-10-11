class GithubWebhooksController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  include GithubWebhook::Processor

  def push(payload)
    # TODO: handle push webhook
  end

  def pull_request(payload)
  end

  def pull_request_review_comment(payload)
  end

  def webhook_secret(payload)
    ENV['GITHUB_WEBHOOK_SECRET']
  end
end
