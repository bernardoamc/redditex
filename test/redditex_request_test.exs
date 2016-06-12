defmodule Redditex.RequestTest do
  use ExUnit.Case

  defmodule HTTPMock do
    def get("https://www.reddit.com/r/test.json", _) do
      { :ok, %{status_code: 200, body: :success_without_order}}
    end

    def get("https://www.reddit.com/r/test/new.json", _) do
      { :ok, %{status_code: 200, body: :success_with_order}}
    end

    def get(_, _) do
      { :error, %{status_code: 404, body: :invalid_request}}
    end
  end

  test "url is requested correctly without order" do
    assert Redditex.Request.get(%Redditex.Request{name: "test"}, HTTPMock) ==
      {:ok, :success_without_order}
  end

  test "url is requested correctly with order" do
    assert Redditex.Request.get(%Redditex.Request{name: "test", order: "new"}, HTTPMock) ==
      {:ok, :success_with_order}
  end

  @tag :reddit_request
  test "reddit returns expected JSON structure" do
    {:ok, body} = Redditex.Request.get(%Redditex.Request{name: "bjj"}, HTTPoison)

    response = body
      |> Poison.decode!

    assert Map.has_key?(response, "data")
    assert Map.has_key?(response["data"], "children")
  end
end
