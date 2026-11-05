cask "glpi-agent-nightly" do
  version "1.22-git48f2d4d9"

  on_arm do
    sha256 "61f90c7890bdb7d41439f266bf8dc03f9ef67e435336bea9c47e2fce0080d313"

    url "https://nightly.glpi-project.org/glpi-agent/GLPI-Agent-#{version}_arm64.pkg"

    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end
  on_intel do
    sha256 "df0180234a0d3f29add89f70749bfdd84cd17d66a506ca41bd03bbd253bda55b"

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
