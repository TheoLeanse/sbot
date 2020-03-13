defmodule SlackbotWeb.SlackbotController do
  use SlackbotWeb, :controller
  alias SlackbotWeb.Slack

  def index(conn, params) do
    case params do
      %{"challenge" => challenge} ->
        send_resp(conn, 200, challenge)

      _ ->
        params
        |> get_in(["event", "channel"])
        |> send_to_slack("what is up??")

        conn
        |> send_resp(200, "bleep")
    end
  end

  defp send_to_slack(channel, text) do
    json = Jason.encode!(%{text: text, channel: channel})

    Slack.post("/chat.postMessage", json, [])
    |> IO.inspect()
  end
end

# defmodule SlackbotWeb.Slack do
#   use HTTPoison.Base

#   def process_request_url(url) do
#     "https://slack.com/api" <> url
#   end

#   def process_request_headers(headers) do
#     [
#       Authorization: "Bearer YOUR-SLACKBOT-API-KEY-HERE",
#       "Content-Type": "application/json"
#     ] ++ headers
#   end
# end
