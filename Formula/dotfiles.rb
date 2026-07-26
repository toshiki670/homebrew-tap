class Dotfiles < Formula
  desc "Personal dotfiles CLI plus companion Rust commands"
  homepage "https://github.com/toshiki670/dotfiles"
  url "https://github.com/toshiki670/dotfiles/archive/refs/tags/v0.71.7.tar.gz"
  sha256 "fddd4a2a4ef928a63937968e47ded024c8888dc691d69a79cf3d335ea5c37461"
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
