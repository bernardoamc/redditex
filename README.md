# Redditex

**List topics of a subreddit from the command line.**

## Initial Steps

**Running tests**

To run the tests that do not make external requests:
```
mix test
```

To run all the tests:
```
mix test --include reddit_request
```

**Compiling the project:**

First, update dependencies with:
```
mix.deps.get
```

Then, build the app with:
```
mix escript.build
```

## Usage

```
./redditex --help

./redditex mysubreddit

./redditex mysubreddit --order new|rising|controversial|top|gilded|wiki|promoted
```
