cask "glpi-agent" do
  version "1.21"

  on_arm do
    sha256 "8bc6e200fd100f2f818d9b0028c94b7a624c497a33547789c4bd2aeea8a0d69a"

    url "https://github.com/glpi-project/glpi-agent/releases/download/#{version}/GLPI-Agent-#{version}_arm64.pkg"

    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end
  on_intel do
    sha256 "58ec0511da542e582cf62d31f783629a0e748f0e83520c41a1024d3c026bcf70"

    url "https://github.com/glpi-project/glpi-agent/releases/download/#{version}/GLPI-Agent-#{version}_x86_64.pkg"

    pkg "GLPI-Agent-#{version}_x86_64.pkg"
  end

  name "GLPI Agent"
  desc "Hardware and software inventory tool for GLPI"
  homepage "https://github.com/glpi-project/glpi-agent"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "glpi-agent-nightly"
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
