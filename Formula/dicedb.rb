class Dicedb < Formula
  desc "Command-line interface for DiceDB, a fast in-memory database"
  homepage "https://github.com/DiceDB/dicedb-cli"
  url "https://github.com/DiceDB/dicedb-cli/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "ac72be492305feaa993908def3b2181a0c3ebf09cfc7877a86c3dbabe9f6e8ed"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    system "make", "build"
    bin.install "dicedb"
  end

  def caveats
    <<~EOS
      This installs only the DiceDB CLI.

      To run the DiceDB engine, use Docker:
        docker run -p 7379:7379 dicedb/dicedb:latest

      Or build the engine from source:
        git clone https://github.com/DiceDB/dice
        cd dice && make build
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/dicedb --help")
  end
end
