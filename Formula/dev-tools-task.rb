class DevToolsTask < Formula
  desc "Modular Task (go-task) library of shell dev-ops helpers — AWS, Kubernetes, Helm, Terraform, SQL, SSH, Git, Security, Diagnostics"
  homepage "https://github.com/afeldman/dev-tools-task"
  url "https://github.com/afeldman/dev-tools-task/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "844bf23c404ddc24eff4d3932c1a62998cfd090118d309a2cd1523b3f1dffa77"
  version "0.2.0"

  depends_on "go-task"

  def install
    pkgshare.install "tasks", "Taskfile.yml"
    (pkgshare/"scripts/lib").install Dir["scripts/lib/*.sh"]

    # go-task refuses a `dotenv:` declaration on an *included* Taskfile — and
    # this one gets included by the thin per-project Taskfile.yml that
    # `dev-tools-task` writes, which declares its own dotenv. Strip the
    # block from the installed copy (same fix as global-mode install.sh).
    inreplace pkgshare/"Taskfile.yml" do |s|
      s.gsub!(/^dotenv:\n(?:^[ \t]*-.*\n)+\n?/, "")
    end

    bin.install "bin/dev-tools-task"
  end

  test do
    assert_predicate bin/"dev-tools-task", :executable?
    assert_predicate pkgshare/"Taskfile.yml", :exist?
    refute_match "dotenv:", (pkgshare/"Taskfile.yml").read
  end
end
