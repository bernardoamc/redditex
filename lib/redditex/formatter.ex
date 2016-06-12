defmodule Redditex.Formatter do
  @base_url Application.get_env(:redditex, :reddit_url)

  def display({:ok, body}) do
    body
      |> Poison.decode!
      |> Map.fetch!("data")
      |> Map.fetch!("children")
      |> fetch_topics
      |> display_topics
  end

  def display({:error, body}) do
    IO.puts "Error: #{body}"
    System.halt(0)
  end

  defp fetch_topics(topic_list) do
    Enum.map(topic_list, fn(topic) ->
      data = Map.fetch!(topic, "data")
      %{title: data["title"], url: data["url"], permalink: data["permalink"]}
    end)
  end

  def display_topics(topics) do
    IO.puts String.duplicate("---", 10)

    Enum.each(topics, fn(topic) ->
      IO.puts "Title: #{topic[:title]}"
      IO.puts "URL: #{topic[:url]}"
      IO.puts "Permalink: #{@base_url}#{topic[:permalink]}"
      IO.puts String.duplicate("---", 10)
    end)
  end
end
