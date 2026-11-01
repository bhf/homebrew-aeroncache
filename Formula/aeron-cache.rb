class AeronCache < Formula
  desc "Aeron Cache Monolith, UI, and MCP"
  homepage "https://github.com/bhf/aeron-cache"
  url "https://github.com/bhf/aeron-cache/releases/download/v0.0.43-SNAPSHOT/cache-monolith-v0.0.43-SNAPSHOT.tar.gz"
  sha256 "a1c24084dbea59fcb782bd18571b5b37239b35c343d27e7ce1c9f7a9b0810e4c"
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
