defmodule Redditex do
  alias Redditex.Request
  alias Redditex.Formatter

  def main(args) do
    args
      |> parse_args
      |> make_request
      |> Formatter.display
  end

  def parse_args(args) do
    parse = OptionParser.parse(args,
      switches: [order: :string, help: :boolean],
      aliases: [h: :help, o: :order]
    )

    case parse do
      { [help: true], _, _ } -> :help
      { [order: order], [subreddit], _ } -> %Request{name: subreddit, order: order}
      { _, [subreddit], _ } -> %Request{name: subreddit}
      _ -> :help
    end
  end

  defp make_request(:help) do
    IO.puts """
      usage: redditex <subreddit> --order [new|rising|controversial|top|gilded|wiki|promoted]
    """

    System.halt(0)
  end

  defp make_request(params) do
    Request.get(params, HTTPoison)
  end
end
