cask "glpi-agent" do
  version "1.19"

  on_arm do
    sha256 "abb4606512aaa9baaf2495b9e556f0d8f4210b847e885d769fdd6b2eb5ef4df7"

    url "https://github.com/glpi-project/glpi-agent/releases/download/#{version}/GLPI-Agent-#{version}_arm64.pkg"

    pkg "GLPI-Agent-#{version}_arm64.pkg"
  end
  on_intel do
    sha256 "f5d819e60e6c47ad0edecb3588534464635da84caa9c16e14652c5da73d06c1d"

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
