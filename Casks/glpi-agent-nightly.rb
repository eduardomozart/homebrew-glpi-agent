cask "glpi-agent-nightly" do
  version "1.22-git3c0d65d8"

  on_arm do
    sha256 "18f39023d847b5c4d0e376d94de5a20da7ee88eef1d7caabc412014fc3153a98"

    url "https://nightly.glpi-project.org/glpi-agent/GLPI-Agent-#{version}_arm64.pkg"

    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end
  on_intel do
    sha256 "54d0029c4e62c35e0a4526aa4bd19ff7624fdddabaeb6bbf211237962685aaff"

    url "https://nightly.glpi-project.org/glpi-agent/GLPI-Agent-#{version}_x86_64.pkg"

    pkg "GLPI-Agent-#{version}_x86_64.pkg"
  end

  name "GLPI Agent Nightly"
  desc "Hardware and software inventory tool for GLPI"
  homepage "https://nightly.glpi-project.org/glpi-agent/"

  livecheck do
    url "https://nightly.glpi-project.org/glpi-agent/"
    regex(/href=.*?GLPI-Agent[._-]v?(\d+(?:\.\d+)+-git[a-f0-9]+)_x86_64\.pkg/i)
  end

  conflicts_with cask: "glpi-agent"
  depends_on :macos

  uninstall launchctl: [
              "com.teclib.glpi-agent",
              "org.glpi-project.glpi-agent",
            ],
            pkgutil:   [
              "com.teclib.glpi-agent",
              "org.glpi-project.glpi-agent",
            ],
            delete:    "/Applications/GLPI-Agent"
end
