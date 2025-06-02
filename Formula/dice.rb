class Dice < Formula
  desc "DiceDB engine – fast, reactive, in-memory database"
  homepage "https://github.com/DiceDB/dice"
  url "https://github.com/DiceDB/dice/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    ENV["GOPROXY"] = "direct"
    ENV["GOSUMDB"] = "off"
    system "go", "build", "-o", bin/"dicedb"
  end

  def caveats
    <<~EOS
      The DiceDB engine has been installed as 'dicedb'.

      To start the server:
        dicedb

      The server listens on port 7379 by default.
      For more information, visit: https://github.com/DiceDB/dice
    EOS
  end

  test do
    assert_match "DiceDB", shell_output("#{bin}/dicedb --help")
  end
end
