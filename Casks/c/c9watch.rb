cask "c9watch" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "d039e02ae4b69224a0b2b933a5e55fc667767d020b9696ddb74e79a554812135",
         intel: "3e8496c1c130cb1e5f3329c2931d249b013732deb0e50188b44d69f691d858ee"

  url "https://github.com/minchenlee/c9watch/releases/download/v#{version}/c9watch_v#{version}_#{arch}.dmg"
  name "c9watch"
  desc "Monitor and control all your Claude Code sessions"
  homepage "https://github.com/minchenlee/c9watch"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "c9watch.app"
  binary "#{appdir}/c9watch.app/Contents/MacOS/c9watch", target: "c9watch"

  zap trash: [
    "~/Library/Application Support/com.minchenlee.c9watch",
    "~/Library/Caches/com.minchenlee.c9watch",
    "~/Library/Preferences/com.minchenlee.c9watch.plist",
    "~/Library/Saved Application State/com.minchenlee.c9watch.savedState",
    "~/Library/WebKit/com.minchenlee.c9watch",
  ]
end
