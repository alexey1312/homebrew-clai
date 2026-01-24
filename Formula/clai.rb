class Clai < Formula
  desc "LLM-powered CLI help assistant"
  homepage "https://github.com/alexey1312/clai"
  version "1.1.2"
  license "MIT"

  on_macos do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-macos.zip"
    sha256 "e3c6e1d817d79f9312e112f9d2b37358e591cda5a5515ac8208a479ed84d1345"

    depends_on macos: :sonoma
  end

  on_linux do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-linux-x64.tar.gz"
    sha256 "c2bb4f392ed01845b418c8a5fa032e97011e900b60a13bac74ea16aba1de20fc"
  end

  def install
    bin.install "clai"
    # Install MLX Metal library for local inference on Apple Silicon
    bin.install "mlx.metallib" if File.exist?("mlx.metallib")
    generate_completions_from_executable(bin/"clai", "completions", "generate")
  end

  test do
    assert_match "clai", shell_output("#{bin}/clai --version")
  end
end
