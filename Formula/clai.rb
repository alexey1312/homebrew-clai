class Clai < Formula
  desc "LLM-powered CLI help assistant"
  homepage "https://github.com/alexey1312/clai"
  version "1.0.1"
  license "MIT"

  on_macos do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-macos.zip"
    sha256 "7f2b7bf1a28a0f3caf261ecc03801fe62eb40107bbc7aca249d0ddce6547cc8f"

    depends_on macos: :sonoma
  end

  on_linux do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-linux-x64.tar.gz"
    sha256 "e084d2c5b0723372872489828cae3b8664701302d7075d98f21528667feeb907"
  end

  def install
    bin.install "clai"
    generate_completions_from_executable(bin/"clai", "completions")
  end

  test do
    assert_match "clai", shell_output("#{bin}/clai --version")
  end
end
