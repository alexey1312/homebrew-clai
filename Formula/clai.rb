class Clai < Formula
  desc "LLM-powered CLI help assistant"
  homepage "https://github.com/alexey1312/clai"
  version "1.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-macos.zip"
    sha256 "c9dcb111db5b0a317dd6c0b75af913a7627e4569005bf91f8a4518b31ae46396"

    depends_on macos: :sonoma
  end

  on_linux do
    url "https://github.com/alexey1312/clai/releases/download/v#{version}/clai-linux-x64.tar.gz"
    sha256 "a898b0bc40200d20b4da967445748f1b2baa015417551e95c276adae21a49bd5"
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
