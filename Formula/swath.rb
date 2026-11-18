class Swath < Formula
  desc "Parallel listing and inventory of object stores and filesystems"
  homepage "https://swath.varve.io"
  url "https://github.com/varveio/swath/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "37b487b7612f19be1015c52a8621be458380cd64b28d44a12277e32d13acf24c"
  license "Apache-2.0"
  head "https://github.com/varveio/swath.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  deny_network_access!

  def fetch
    system "go", "mod", "download"
  end

  def install
    # build.sh's stamps: the release's X.Y.Z, and the commit the tag's archive
    # records, so `swath --version` reads as the release binary's does.
    buildinfo = "github.com/varveio/swath/internal/buildinfo"
    commit = Utils::Git.get_tar_commit_id(cached_download) if build.stable?
    ldflags = ["-X #{buildinfo}.Version=#{version}"]
    ldflags << "-X #{buildinfo}.Revision=#{commit}" if commit.present?

    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags:), "./cmd/swath"
    generate_completions_from_executable(bin/"swath", "completion")
  end

  test do
    assert_match "swath #{version}", shell_output("#{bin}/swath --version")
    assert_match "#compdef swath", (zsh_completion/"_swath").read

    (testpath/"tree/a/x").write "hello"
    (testpath/"tree/y").write "swath!"
    total = JSON.parse(shell_output("#{bin}/swath du #{testpath}/tree --format jsonl").lines.first)
    assert_equal "total", total["row_type"]
    assert_equal 2, total["objects"]
    assert_equal 11, total["size"]
  end
end
