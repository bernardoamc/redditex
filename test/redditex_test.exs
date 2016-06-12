defmodule RedditexTest do
  use ExUnit.Case

  import Redditex

  test ":help returned when -h or --help option is specified" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test ":help returned when subreddit is not specified" do
    assert parse_args(["-o", "new"]) == :help
  end

  test "subreddit and order options are parsed correctly" do
    assert parse_args(["mysubreddit"]) == %Redditex.Request{name: "mysubreddit", order: ""}
    assert parse_args(["-o", "new", "mysubreddit"]) == %Redditex.Request{name: "mysubreddit", order: "new"}
  end
end
