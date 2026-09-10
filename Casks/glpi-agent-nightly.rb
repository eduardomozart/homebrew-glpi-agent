cask "glpi-agent-nightly" do
  version "1.20-gitdc387bfa"

  on_arm do
    sha256 "f7dda4518bc904df2e0004182f131dd24060b1fc70cb7bd4fd38f8d8932fbc77"

    url "https://nightly.glpi-project.org/glpi-agent/GLPI-Agent-#{version}_arm64.pkg"

    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end
  on_intel do
    sha256 "f6a966ed43b690f725c92112f612b085c846ae67372bc0844968cde16e4d9ccb"

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
