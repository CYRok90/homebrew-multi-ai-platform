class AiBarracks < Formula
  desc "Git-native AI agent workspace with session tracking and persistent memory"
  homepage "https://github.com/CYRok90/ai-barracks"
  url "https://github.com/CYRok90/ai-barracks/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "d8a979316c0250caa93208be1723c0df3e5dd4cb055192f00879095171d2a59b"
  license "MIT"

  def install
    bin.install "bin/aib"
    pkgshare.install "templates"
    pkgshare.install "scripts"

    # Patch template dir path in the aib script
    inreplace bin/"aib", /^TEMPLATE_DIR=.*$/, "TEMPLATE_DIR=\"#{pkgshare}/templates\""
  end

  test do
    system bin/"aib", "version"
  end
end
