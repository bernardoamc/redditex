defmodule Redditex.Request do
  defstruct name: "", order: ""
  @base_url Application.get_env(:redditex, :reddit_url)
  @user_agent [ {"User-agent", "Redditex - Read easily your favorite topics"} ]

  def get(%Redditex.Request{name: name, order: order}, http_library) do
    subreddit_url(name, order)
      |> http_library.get(@user_agent)
      |> parse_response
  end

  defp subreddit_url(name, ""), do: "#{@base_url}/r/#{name}.json"
  defp subreddit_url(name, order), do: "#{@base_url}/r/#{name}/#{order}.json"

  defp parse_response({:ok, %{status_code: 200, body: body}}) do
    { :ok, body }
  end

  defp parse_response({_, %{status_code: _, body: body}}) do
    { :error, body }
  end
end
