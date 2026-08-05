class Dotfiles < Formula
  desc "Personal dotfiles CLI plus companion Rust commands"
  homepage "https://github.com/toshiki670/dotfiles"
  url "https://github.com/toshiki670/dotfiles/archive/refs/tags/v0.71.10.tar.gz"
  sha256 "be9e294512c6a74fed94492bd5772ff6e8f5fc80d9c106b4e0002d2f7384f4da"
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
