class Dotfiles < Formula
  desc "Personal dotfiles CLI plus companion Rust commands"
  homepage "https://github.com/toshiki670/dotfiles"
  url "https://github.com/toshiki670/dotfiles/archive/refs/tags/v0.71.4.tar.gz"
  sha256 "ecdb4c9404c1d9aeb2d249ecd0b375329a9c560bc8e2fb303ba9969ceccd98a0"
  license "MIT"

  depends_on "rust" => :build

  def install
    # the workspace's tools/ members also carry bin targets, so the package name
    # must be given explicitly or this fails with "multiple packages with binaries found".
    system "cargo", "install", *std_cargo_args, "dotfiles"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotfiles --version")
    system bin/"dotfiles", "list"
  end
end
