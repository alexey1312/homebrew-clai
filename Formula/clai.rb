class Clai < Formula
  desc "LLM-powered CLI help assistant"
  homepage "https://github.com/alexey1312/clai"
  version "1.0.4"
  license "MIT"

  on_macos do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-macos.zip"
    sha256 "1d243c7d99784b0567fa8d803cf62dc73b64cec07f5f2bd8a93213a054dc4381"

    depends_on macos: :sonoma
  end

  on_linux do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-linux-x64.tar.gz"
    sha256 "8ceb566363d8090b48038b26a15a07fe5e878c20e44063200c81efef63722651"
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
