cask "hypermac" do
  version "1.5.0,hypermac-1.5-ec92a0b-20261118T120129Z-macos-arm64"
  sha256 "18aae9b947043fc27d1989e82286e9bb5417317ddc73c1af34fc1ae5ded1b43a"

  url "https://github.com/keelos-dev/hyperMAC/releases/download/#{version.csv.second}/#{version.csv.second}.dmg"
  name "hyperMAC"
  desc "Remote desktop (RDP) server and virtual machine manager"
  homepage "https://github.com/keelos-dev/hyperMAC"

  # The app updates itself ("Check for Updates…"); brew upgrade leaves it alone.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "hyperMAC.app"

  uninstall launchctl: [
              "dev.keelos.hypermac",
              "dev.keelos.hypermac.menu",
            ],
            quit:      "dev.keelos.hypermac",
            delete:    [
              "~/Library/LaunchAgents/dev.keelos.hypermac.menu.plist",
              "~/Library/LaunchAgents/dev.keelos.hypermac.plist",
            ]

  zap trash: "~/Library/Application Support/hyperMAC"
end
