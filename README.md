# Redditex

**List topics of a subreddit from the command line.**

## Initial Steps

To run the tests:
```
mix test
```

To compile the project:

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
