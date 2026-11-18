# varveio/tap

Homebrew formulae for Varve's open-source tools, on macOS and Linux.

| Formula | What it is |
|---|---|
| [`swath`](Formula/swath.rb) | [swath](https://github.com/varveio/swath): parallel listing and inventory of object stores and filesystems |

## Install

```sh
brew install varveio/tap/<formula>
```

Installing by the full name trusts only that formula; see Homebrew's
[tap trust](https://docs.brew.sh/Tap-Trust). In a `Brewfile`:

```ruby
tap "varveio/tap"
brew "varveio/tap/<formula>"
```

Formulae build from their release's source. Bottles, built and tested by this tap's CI, install
without a build toolchain on the platforms they cover; elsewhere Homebrew builds from source.

## Maintaining

- `tests.yml` runs `brew test-bot` on every pull request and uploads the bottles it builds.
- `publish.yml` (`brew pr-pull`) is run by hand with a green pull request's number. It
  uploads that PR's bottles to a GitHub release, adds the bottle block to the formula and
  pushes to `main`.
- `autobump.yml` checks daily for new releases and opens version-bump pull requests.
  Pull requests opened with the workflow's own token do not start other workflows, so close
  and reopen a bump PR to run `tests.yml` on it before publishing.
