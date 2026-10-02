class Auditeur < Formula
  desc "Local evidence-driven software auditor"
  homepage "https://github.com/afeldman/auditeur"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/afeldman/auditeur/releases/download/v0.1.4/auditeur-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "61fb52603b9d352badca9c02a61f3dff476d2e8ba1c78963edb634ebee76ce60"
    end
    if Hardware::CPU.arm?
      url "https://github.com/afeldman/auditeur/releases/download/v0.1.4/auditeur-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "28d94cb3048f165ca7c2df14c9532435251abe4616ea6e01bd3787580ef15983"
    end
  end

  def install
    # The archive nests the binary in a target-named directory; Homebrew stages
    # a lone top-level directory as the build root, so it lands here as "auditeur".
    bin.install "auditeur"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/auditeur --version")
  end
end
