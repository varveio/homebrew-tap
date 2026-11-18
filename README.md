# varveio/tap

The Homebrew tap for [swath](https://github.com/varveio/swath), parallel listing and inventory of
object stores and filesystems.

```sh
brew install varveio/tap/swath
```

This installs `swath` and `swath-replay` on macOS and Linux. Installing by the full name trusts
only that formula; see Homebrew's [tap trust](https://docs.brew.sh/Tap-Trust). In a `Brewfile`:

```ruby
tap "varveio/tap"
brew "varveio/tap/swath"
```

The formula builds swath from its release's source archive. Bottles, built and tested by this
tap's CI, install without a Go toolchain on the platforms they cover; elsewhere Homebrew builds
from source. `swath --version` reports the release and its commit, as the release binaries do.

Other ways to install, and how to verify a release archive's signature, are in swath's
[install guide](https://swath.varve.io/docs/install).

## Maintaining

- `tests.yml` runs `brew test-bot` on every pull request and uploads the bottles it builds.
- `publish.yml` (`brew pr-pull`) is run by hand with a green pull request's number. It
  uploads that PR's bottles to a GitHub release, adds the bottle block to the formula and
  pushes to `main`.
- `autobump.yml` checks daily for a new swath release and opens a version-bump pull request.
  Pull requests opened with the workflow's own token do not start other workflows, so close
  and reopen a bump PR to run `tests.yml` on it before publishing.
