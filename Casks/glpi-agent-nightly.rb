cask "glpi-agent-nightly" do
  version "1.22-git9408ea98"

  on_arm do
    sha256 "73417c4fc9060886838ad7efe21bb5393f644f2ceb9d898d27ea7fd72d25e3b4"

    url "https://nightly.glpi-project.org/glpi-agent/GLPI-Agent-#{version}_arm64.pkg"

    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end
  on_intel do
    sha256 "404b12e95bfccfa53c9108c04895ffa878fcbca5bf257448506562639450f0d5"

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
