class Dicedb < Formula
  desc "DiceDB engine – fast, reactive, in-memory database"
  homepage "https://github.com/DiceDB/dice"
  url "https://github.com/DiceDB/dice/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1c613e44c8136d67dec73e92e084d38f39710d286fd1880998960891eb798a02"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    ENV["GOPROXY"] = "direct"
    ENV["GOSUMDB"] = "off"

    # Patch: create missing VERSION file in the root, as expected by build
    (version_path = buildpath/"VERSION").write("v1.0.0") unless (buildpath/"VERSION").exist?

    system "go", "build", "-o", bin/"dicedb", "./cmd/dicedb"
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