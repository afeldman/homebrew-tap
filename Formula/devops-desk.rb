class DevopsDesk < Formula
  desc "Terminal-based DevOps control center — unified AWS, EKS, K8s, Flux, Helm, Terraform, OCI, GitHub"
  homepage "https://github.com/afeldman/devops-desk"
  version "0.1.0"
  url "https://github.com/afeldman/devops-desk/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8456181d460f1cd57e6a8bf44dc3163ca2fc7047367e114293f3dc0c946e2b5d"

  SKIP = %w[install.sh release.sh CLAUDE.md README.md Makefile test-bundle.sh .github].freeze

  depends_on "bash"
  depends_on "fzf"
  depends_on "aws-cli"
  depends_on "kubectl"

  def install
    # Find the main entry point (devops-desk script)
    bin.install "bin/devops-desk" if File.exist?("bin/devops-desk")

    # Install supporting scripts from scripts/ directory
    if File.directory?("scripts")
      Dir["scripts/*"].each do |f|
        next if File.directory?(f)
        next if SKIP.include?(File.basename(f))
        next unless File.read(f).start_with?("#!") rescue false
        bin.install f
      end
    end

    # Install lib files (sourced by scripts, not executable)
    if File.directory?("lib")
      (libexec / "lib").install Dir["lib/*"]
    end

    # Install config templates
    if File.directory?("config")
      (etc / "devops-desk").install Dir["config/*"]
    end
  end

  test do
    assert_predicate bin/"devops-desk", :executable?
  end
end
