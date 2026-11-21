cask "hypermac" do
  version "1.5.1,hypermac-1.5-d625906-20261121T030544Z-macos-arm64"
  sha256 "4b695f06c8b683d811411969dc140768d065c1c0e17b7817a91c5a428c717eaf"

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
