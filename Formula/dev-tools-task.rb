class DevToolsTask < Formula
  desc "Modular Task (go-task) library of shell dev-ops helpers — AWS, Kubernetes, Helm, Terraform, SQL, SSH, Git, Security, Diagnostics"
  homepage "https://github.com/afeldman/dev-tools-task"
  url "https://github.com/afeldman/dev-tools-task/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "c677a1cf7acfab38e16696893e909d5c57b165d703aed25906f7af58158584de"
  version "0.2.1"

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

  def caveats
    <<~EOS
      Requires go-task (the `task` binary) to actually run the library:
        brew install go-task
      Then, inside a project:
        dev-tools-task
        task devtools:<task>
    EOS
  end

  test do
    assert_predicate bin/"dev-tools-task", :executable?
    assert_predicate pkgshare/"Taskfile.yml", :exist?
    refute_match "dotenv:", (pkgshare/"Taskfile.yml").read
  end
end
