class AeronCache < Formula
  desc "Aeron Cache Monolith, UI, and MCP"
  homepage "https://github.com/bhf/aeron-cache"
  url "https://github.com/bhf/aeron-cache/releases/download/v0.0.26-SNAPSHOT/cache-monolith-v0.0.26-SNAPSHOT.tar.gz"
  sha256 "f36d0560dbb36b10bcb78ca4a0a19886debb224678bed4c812dc8a7fd060277f"
  license "Apache-2.0"

  depends_on "openjdk"
  depends_on "node"

  def install
    # Install the backend and frontend components into a hidden libexec directory
    libexec.install "cache-monolith", "cache-ui", "config"
    
    # Expose the central `aeron-cache` binary
    bin.install "aeron-cache"
  end

  def caveats
    <<~EOS
      To start the Aeron Cache backend, UI, and MCP server, run:
        aeron-cache
      
      Configuration files and generated .env variables are located in ~/.aeron-cache/
    EOS
  end
end
