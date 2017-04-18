# Freclixir

A little [Freckle](letsfreckle.com) CLI, written in elixir.

## Installation

```
git clone https://github.com/shkm/freCLIxir.git
cd freCLIxir
mix deps.get
mix escript.build
# copy freclixir somewhere in your path
```

## Commands

TODO: write a decent help. For now:

freclixir projects list
freclixir timers list
freclixir timers start [project_id]

## TODO

A lot. I primarily want this tool for tracking my time, so next up is to improve that
so we don't have to type in project IDs.

## Why?

I wrote a [little Ruby CLI](https://github.com/shkm/frecli) and
[API client](https://github.com/shkm/freckle-api) a while ago.  These started
working weirdly, and I figured I could use some more Elixir practice, so let's
rebuild in Elixir. And let's keep it simple this time.

As such, you'll probably see some weird code. I'm in it to learn, so please
point out any weirdness or send a PR if you like.
