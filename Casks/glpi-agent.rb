cask "glpi-agent" do
  version "1.20"

  on_arm do
    sha256 "2bb9794f35e92471120ecf805c5df85a27e96115385776e3fc33ad2a8f9cdca3"

    url "https://github.com/glpi-project/glpi-agent/releases/download/#{version}/GLPI-Agent-#{version}_arm64.pkg"

    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end
  on_intel do
    sha256 "863ab0dd0628d23816209ad5cdd8272f9953df121237802dc5fb9a15b3f2471e"

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
