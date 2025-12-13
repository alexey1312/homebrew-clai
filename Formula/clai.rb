class Clai < Formula
  desc "LLM-powered CLI help assistant"
  homepage "https://github.com/alexey1312/clai"
  version "1.0.2"
  license "MIT"

  on_macos do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-macos.zip"
    sha256 "b65bbe280f060bbc0b81d73abf45335027280a8f799e85175b08f85bc39cd7cb"

    depends_on macos: :sonoma
  end

  on_linux do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-linux-x64.tar.gz"
    sha256 "76cf9876aeeb4d73910e5fd81ab1e02436353b677f07ec78928e69d2d3e57664"
  end

  def install
    bin.install "clai"
    # Install MLX Metal library for local inference on Apple Silicon
    bin.install "mlx.metallib" if File.exist?("mlx.metallib")
    generate_completions_from_executable(bin/"clai", "completions")
  end

  test do
    assert_match "clai", shell_output("#{bin}/clai --version")
  end
end
