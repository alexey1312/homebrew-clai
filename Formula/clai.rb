class Clai < Formula
  desc "LLM-powered CLI help assistant"
  homepage "https://github.com/alexey1312/clai"
  version "1.0.6"
  license "MIT"

  on_macos do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-macos.zip"
    sha256 "b817890c7ff9389ac58ac0fb44df40731625d01a562e87dd77f99ded6a14a6a2"

    depends_on macos: :sonoma
  end

  on_linux do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-linux-x64.tar.gz"
    sha256 "481823d77496fd8a0f0bca840ce849f69d7a6ebf5b3779ec51d2de3c2c829ab2"
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
