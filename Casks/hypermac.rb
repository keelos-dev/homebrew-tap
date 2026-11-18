cask "hypermac" do
  version "1.4.4,hypermac-1.4-6d23f23-20261115T050628Z-macos-arm64"
  sha256 "0495ca23a0793fb1a5693df1faf75e984a95b3598c117223eff6b92f52d02b39"

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
