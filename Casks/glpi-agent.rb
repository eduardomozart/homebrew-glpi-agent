cask "glpi-agent" do
  version "1.18"

  if Hardware::CPU.intel?
    sha256 "d644884155dda0f1798732f05f348e22abc126f5e1d6101b695dc48b14a70ffe"
    url "https://github.com/glpi-project/glpi-agent/releases/download/#{version}/GLPI-Agent-#{version}_x86_64.pkg"
    pkg "GLPI-Agent-#{version}_x86_64.pkg"
  else
    sha256 "5b3aca3df9c62ed1932bc1075d479e3c32cd45e5855a22f8722dbb0a3dff89e7"
    url "https://github.com/glpi-project/glpi-agent/releases/download/#{version}/GLPI-Agent-#{version}_arm64.pkg"
    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end

  name "GLPI Agent"
  desc "GLPI Agent for Mac OS X"
  homepage "https://github.com/glpi-project/glpi-agent"

  livecheck do
    url :url
    strategy :github_latest
  end


  uninstall pkgutil: [
              "com.teclib.glpi-agent",
              "org.glpi-project.glpi-agent",
            ],
            delete:  [
              "/opt/glpi-agent",
            ],
            launchctl: [
              "org.glpi-project.glpi-agent",
              "com.teclib.glpi-agent",
            ]
end
