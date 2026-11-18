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
brew "varveio/tap/<formula>", trusted: true
```

Formulae build from their release's source. Bottles, built and tested by this tap's CI, install
without a build toolchain on Apple silicon (macOS 15 and later) and on Linux (x86-64 and ARM64);
elsewhere, Intel macOS included, Homebrew builds from source.

## Maintaining

- `tests.yml` runs `brew test-bot` on every pull request and uploads the bottles it builds.
- `publish.yml` (`brew pr-pull`) is run by hand with a green pull request's number. It
  uploads that PR's bottles to a GitHub release, adds the bottle block to the formula and
  pushes to `main`.
- Version bumps are manual for now: `brew bump-formula-pr --tap=varveio/tap <formula>`
  opens the pull request. `autobump.yml`, the scaffold's daily bump, is disabled: the
  organization does not let workflows open pull requests, and a pull request opened with a
  workflow's own token would not start `tests.yml`. A GitHub App token will enable it.
