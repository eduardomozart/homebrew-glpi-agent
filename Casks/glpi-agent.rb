cask "glpi-agent" do
  version "1.18"

  on_arm do
    sha256 "5b3aca3df9c62ed1932bc1075d479e3c32cd45e5855a22f8722dbb0a3dff89e7"

    url "https://github.com/glpi-project/glpi-agent/releases/download/#{version}/GLPI-Agent-#{version}_arm64.pkg"

    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end
  on_intel do
    sha256 "d644884155dda0f1798732f05f348e22abc126f5e1d6101b695dc48b14a70ffe"

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
