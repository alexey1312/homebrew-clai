class Clai < Formula
  desc "LLM-powered CLI help assistant"
  homepage "https://github.com/alexey1312/clai"
  version "1.2.0"
  license "MIT"

  on_macos do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-macos.zip"
    sha256 "e5dc82a516d88a693d1d405c9a0763a2b1ed442eae35dab6cca3b4862be005dd"

    depends_on macos: :sonoma
  end

  on_linux do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-linux-x64.tar.gz"
    sha256 "0bff9a49264152686d956bc4c4ae22dfd18b53bea3c804aee1eb6e6bfc8153d8"
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
