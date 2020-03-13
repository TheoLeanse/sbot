defmodule SlackbotWeb.Slack do
  use HTTPoison.Base

  @token "YOUR_TOKEN_HERE"

  def process_request_url(url) do
    "https://slack.com/api" <> url
  end

  def process_request_headers(headers) do
    [
      Authorization: "Bearer #{@token}",
      "Content-Type": "application/json"
    ] ++ headers
  end
end
