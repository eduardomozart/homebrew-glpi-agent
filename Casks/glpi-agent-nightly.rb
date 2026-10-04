cask "glpi-agent-nightly" do
  version "1.21-git41c99b80"

  on_arm do
    sha256 "774cc376da69ecb7b870e2f4015ad495f06b498e3edfee6e76c5c8c6d7857a12"

    url "https://nightly.glpi-project.org/glpi-agent/GLPI-Agent-#{version}_arm64.pkg"

    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end
  on_intel do
    sha256 "dc5c9d434567d2d06d42efcd902189c3b93ec3529057885837c307f8bc63bfd9"

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
