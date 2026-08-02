cask "tranzl" do
  version "0.1.0"
  sha256 "7cb700cab29b72a6ef1b02df90dd31395d98ff2390b73d04e58a9b840a5a2bb1"

  url "https://github.com/zoltanf/tranzl/releases/download/v#{version}/Tranzl-#{version}-arm64.zip"
  name "Tranzl"
  desc "Private, on-device LLM translator and text editor"
  homepage "https://github.com/zoltanf/tranzl"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Tranzl.app"

  zap trash: [
    "~/Library/Application Support/tranzl",
  ]

  caveats <<~EOS
    Tranzl is ad-hoc signed (not notarized), so macOS Gatekeeper blocks it
    when installed with quarantine. Install or upgrade with:

      brew install --cask zoltanf/tap/tranzl --no-quarantine

    If it was installed without that flag, unblock it once with:

      xattr -dr com.apple.quarantine /Applications/Tranzl.app

    On first use, Tranzl offers to download the Gemma 4 E4B model (~4.6 GB),
    which is subject to Google's Gemma Terms of Use.
  EOS
end
