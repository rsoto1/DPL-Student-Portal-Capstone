class GithubWebhooksController < ApplicationController
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
